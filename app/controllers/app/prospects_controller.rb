class App::ProspectsController < ApplicationController

  before_action :authenticate_user_or_admin!, except: %i[ new_by_slug create  ]
  before_action :set_layout
  before_action :check_client_id, only: %i[ show edit update destroy ]
  before_action :set_app_prospect, only: %i[ show edit update destroy ]
  before_action :set_content_for_sidebar, only: %i[ index search ]
  

  # GET /app/prospects or /app/prospects.json
  def index
    collection = App::Prospect.by_client(get_client_id).includes(:vendor).order(created_at: :desc)
    @pagy,  @app_prospects = pagy(collection)
    @collection_src_url = 'app_prospects_url'

    respond_to do |format|
      format.html  
      format.turbo_stream 
    end

  end

  # GET /app/prospects/1 or /app/prospects/1.json
  def show
  end

  # GET /app/prospects/new
  def new
    @app_prospect = App::Prospect.new
    @app_prospect.vendor_id = current_user.vendor_id if current_user.vendor_id
  end

  # GET /:slug
  def new_by_slug
    @client = App::Client.find_by(slug: params[:slug])
    
    # se o client não for encontrado e existir um acesso atual, ou se o client for encontrado e o id do client for diferente do id do client do acesso atual, redirecione para a página de prospects
    if (@client.nil? && get_current_access) || (@client && get_current_access.present? && @client.id != get_current_access.client_id)
      flash[:error] = t('views.app.prospects.flash.client_not_found')
      return redirect_to app_prospects_path
    elsif @client.nil? # se não, verifique se existe um cliente. Se não existir, redirecione para a raiz do site
      flash[:error] = t('views.app.prospects.flash.client_not_found')
      return redirect_to site_root_path
    end

    @app_prospect = App::Prospect.new  
    render :new
  end

  # GET /app/prospects/1/edit
  def edit
  end

  # POST /app/prospects or /app/prospects.json
  def create
    @app_prospect = App::Prospect.new(app_prospect_params)
    get_current_access ? set_client_id(@app_prospect) : @app_prospect[:client_id] = app_prospect_params[:client_id]
    
    if @app_prospect.save
        flash[:success] = t('views.app.general.flash.create_f', model: App::Prospect.model_name.human)
        redirect_to app_prospect_url(@app_prospect)
    else
        render :new, status: :unprocessable_entity 
    end
  end

  # PATCH/PUT /app/prospects/1 or /app/prospects/1.json
  def update
    if @app_prospect.update(app_prospect_params)
      flash[:success] = t('views.app.general.flash.update_f', model: App::Prospect.model_name.human)
      redirect_to app_prospect_url(@app_prospect)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /app/prospects/1 or /app/prospects/1.json
  def destroy
    @app_prospect.destroy
    flash[:success] = t('views.app.general.flash.destroy_f', model: App::Prospect.model_name.human)
    redirect_to app_prospects_url
  end

  #  GET /app/prospects/search?query=:query&status=:status
  def search 
    collection = App::Prospect.by_client(get_client_id)

    collection = collection.by_prospect_status(params[:status]).search(params[:query])
    collection = collection.by_vendor(params[:vendor_ids]) if (params[:vendor_ids].present? && params[:status] == 'prospected')


    @pagy,  @app_prospects = pagy(collection.order(created_at: :desc))
    @collection_src_url = 'search_app_prospects_path'
    
    
    respond_to do |format|
      format.html do
        render  "app/prospects/index"
      end
      format.turbo_stream do
        render  "app/prospects/index",
                locals: { collection: @app_prospects, collection_name: "prospects"}
      end
    end


  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_app_prospect
    @app_prospect = App::Prospect.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def app_prospect_params
    params.require(:app_prospect).permit(:vendor_id, :channel, :institution, :city, :course, :amount, :year_graduation, :name, :phone, :instagram, :client_id)
  end

  def set_layout
    get_current_access.present? ? self.class.layout("application") : self.class.layout("public_application") 
  end

  def set_content_for_sidebar
    @vendors = App::Vendor.by_client(get_client_id).joins(:prospects).distinct.order(:name)
  end
    
end
