class App::NegotiationsController < ApplicationController
  before_action :set_app_negotiation, only: %i[ show edit update destroy ]
  before_action :set_contant_for_sidebar, only: %i[ index search ]
  before_action :set_calendars, only: %i[ index search ]

  # GET /app/negotiations or /app/negotiations.json
  def index

    if current_access_is_user? && get_current_access.vendor 
      # recupera a lista de negociações baseada no vendedor atual -- incluí apenas negociações.
      collection = App::Negotiation.by_client(get_client_id).by_vendor(get_current_access.vendor).joins(:course).order('app_courses.name')
      
      # recupera a lista de cidades que contenham negociações de acordo com a coleção de negociações acima.
      @app_cities = App::City.by_client(get_client_id).by_negotiation(collection.ids).order(:name).uniq
      
      # recupera a lista de instituições que contenham negociações de acordo com a coleção de negociações acima.
      @app_institutions = App::Institution.by_client(get_client_id).by_negotiation(collection.ids).order(:abreviation).uniq


    else
      collection = App::Negotiation.none
      @app_institutions = App::Institution.none
      @app_calendars = App::Calendar.none
    end
    @pagy, @app_negotiations = set_pagy(collection)

  end

  # GET /app/negotiations/1 or /app/negotiations/1.json
  def show
  end

  # GET /app/negotiations/new
  # def new
  #   @app_negotiation = App::Negotiation.new
  # end

  # GET /app/negotiations/1/edit
  def edit
  end

  # POST /app/negotiations or /app/negotiations.json
  # def create
  #   @app_negotiation = App::Negotiation.new(app_negotiation_params)

  #   respond_to do |format|
  #     if @app_negotiation.save
  #       format.html { redirect_to app_negotiation_url(@app_negotiation), notice: "Negotiation was successfully created." }
  #       format.json { render :show, status: :created, location: @app_negotiation }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @app_negotiation.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /app/negotiations/1 or /app/negotiations/1.json
  def update
    if @app_negotiation.update(app_negotiation_params)
      flash[:success] = t('views.app.general.flash.update_f', model: App::Negotiation.model_name.human)
      redirect_to app_negotiation_url(@app_negotiation)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /app/negotiations/1 or /app/negotiations/1.json
  # def destroy
  #   @app_negotiation.destroy

  #   respond_to do |format|
  #     format.html { redirect_to app_negotiations_url, notice: "Negotiation was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end


  # GET /app/negotiations/filter?course=ID&target=DIV_ID
  def filter
    @negotiations = App::Negotiation.by_client(get_client_id).by_course(params[:course])
    @target = params[:target]


    respond_to do |format|
      format.turbo_stream
    end
  end

  # GET /app/negotiations/search
  def search

    collection = App::Negotiation.by_client(get_client_id).joins(:course).order('app_courses.name')
    

    if params[:query].present?
      collection = collection.search(params[:query])
      params[:status_ids] = collection.pluck(:status_id).uniq
      params[:vendor_ids] = collection.pluck(:vendor_id).uniq
      # code to replace sidebar content
    elsif params[:status_ids].present? || params[:vendor_ids].present?
      collection = collection.by_status_negotiation(params[:status_ids]) if params[:status_ids].present?
      collection = collection.by_vendor(params[:vendor_ids]) if params[:vendor_ids].present?
    else
      return redirect_to app_negotiations_path
    end
    
    # recupera a lista de cidades que contenham negociações de acordo com a coleção de negociações acima.
    @app_cities = App::City.by_client(get_client_id).by_negotiation(collection.ids).order(:name).uniq
    
    # recupera a lista de instituições que contenham negociações de acordo com a coleção de negociações acima.
    @app_institutions = App::Institution.by_client(get_client_id).by_negotiation(collection.ids).order(:abreviation).uniq


    @pagy, @app_negotiations = set_pagy(collection)

    render :index

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app_negotiation
      @app_negotiation = App::Negotiation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def app_negotiation_params
      params.require(:app_negotiation).permit(:calendar_id, :course_id, :vendor_id, :company_id, :status_id, :reference, :active)
    end

    def set_contant_for_sidebar
      @status = App::StatusNegotiation.by_client(get_client_id).order(:name)
      @vendors = App::Vendor.by_client(get_client_id).order(:name)
    end

    def set_calendars
      @app_calendars = App::Calendar.by_client(get_client_id).by_calendar_status('active').order(year: :desc, semester: :desc)
    end
end
