class App::ProspectsController < ApplicationController

  before_action :authenticate_user_or_admin!, except: %i[ new_by_slug create  ]
  before_action :set_layout
  before_action :set_app_prospect, only: %i[ show edit update destroy ]

  # GET /app/prospects or /app/prospects.json
  def index
    @app_prospects = App::Prospect.by_client(get_client_id)
  end

  # GET /app/prospects/1 or /app/prospects/1.json
  def show
  end

  # GET /app/prospects/new
  def new
    @app_prospect = App::Prospect.new
  end

  # GET /:slug
  def new_by_slug
    return redirect_to new_app_prospect_path if get_current_access

    @app_prospect = App::Prospect.new
    @client = App::Client.find_by(slug: params[:slug])

    # a não ser que o cliente seja encontrado, redirecione para a raiz do site
    unless @client
      flash[:error] = t('views.app.prospects.flash.client_not_found')
      redirect_to site_root_path
    end
  
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
        flash[:success] = t('views.app.general.flash.create', model: App::Prospect.model_name.human)
        redirect_to app_prospect_url(@app_prospect)
    else
        render :new, status: :unprocessable_entity 
    end
  end

  # PATCH/PUT /app/prospects/1 or /app/prospects/1.json
  def update
    if @app_prospect.update(app_prospect_params)
      flash[:success] = t('views.app.general.flash.update', model: App::Prospect.model_name.human)
      redirect_to app_prospect_url(@app_prospect)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /app/prospects/1 or /app/prospects/1.json
  def destroy
    @app_prospect.destroy
    flash[:success] = t('views.app.general.flash.destroy', model: App::Prospect.model_name.human)
    redirect_to app_prospects_url
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_app_prospect
    @app_prospect = App::Prospect.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def app_prospect_params
    params.require(:app_prospect).permit(:vendor_id, :channel, :institution, :city, :course, :ammount, :year_graduation, :name, :phone, :instagram, :client_id)
  end

  def set_layout
    get_current_access.present? ? self.class.layout("application") : self.class.layout("public_application") 
  end
    
end
