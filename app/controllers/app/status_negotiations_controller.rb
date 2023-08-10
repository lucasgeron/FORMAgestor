class App::StatusNegotiationsController < ApplicationController
  before_action :set_form_variables, only: %i[ new edit create update ]
  before_action :set_app_status_negotiation, only: %i[ show edit update destroy ]

  # GET /app/status_negotiations or /app/status_negotiations.json
  def index
    collection = App::StatusNegotiation.by_client(get_client_id).order(:name)
    @pagy,  @app_status_negotiations = set_pagy(collection)
  end

  # GET /app/status_negotiations/1 or /app/status_negotiations/1.json
  def show
  end

  # GET /app/status_negotiations/new
  def new
    @app_status_negotiation = App::StatusNegotiation.new
  end

  # GET /app/status_negotiations/1/edit
  def edit
  end

  # POST /app/status_negotiations or /app/status_negotiations.json
  def create
    @app_status_negotiation = App::StatusNegotiation.new(app_status_negotiation_params)
    set_client_id(@app_status_negotiation)

    if @app_status_negotiation.save
      flash[:success] = t('views.app.general.flash.create_f', model: App::StatusNegotiation.model_name.human)
      redirect_to app_status_negotiation_url(@app_status_negotiation)
    else
        render :new, status: :unprocessable_entity 
    end
  end

  # PATCH/PUT /app/status_negotiations/1 or /app/status_negotiations/1.json
  def update
    if @app_status_negotiation.update(app_status_negotiation_params)
      flash[:success] = t('views.app.general.flash.update_f', model: App::StatusNegotiation.model_name.human)
      redirect_to app_status_negotiation_url(@app_status_negotiation)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /app/status_negotiations/1 or /app/status_negotiations/1.json
  def destroy
    if @app_status_negotiation.has_dependency?
      flash[:error] = t('views.app.general.flash.destroy_failed_f', model: App::StatusNegotiation.model_name.human)
      redirect_to @app_status_negotiation
    else
      @app_status_negotiation.destroy
      flash[:success] = t('views.app.general.flash.destroy_f', model: App::StatusNegotiation.model_name.human)
      redirect_to app_status_negotiations_path
    end
  end

   #  GET /app/calendars/search?query=:query&status=:status
   def search 

    collection = App::StatusNegotiation.by_client(get_client_id)

    collection = collection.by_status_negotiation_status(params[:status])
    collection = collection.search(params[:query].to_s) if params[:query].present?

    @pagy,  @app_status_negotiations = set_pagy(collection)
    
    render :index

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app_status_negotiation
      @app_status_negotiation = App::StatusNegotiation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def app_status_negotiation_params
      params.require(:app_status_negotiation).permit(:name, :active, :icon, :style, :color)
    end

    def set_form_variables
      @styles = App::StatusNegotiation::STYLES.map{ |style| [style, t("activerecord.options.app/status_negotiation.STYLE.#{style}")]}
    end
end
