class App::StatusInteractionsController < ApplicationController
  before_action :set_form_variables, only: %i[ new edit create update ]
  before_action :set_app_status_interaction, only: %i[ show edit update destroy ]

  # GET /app/status_interactions or /app/status_interactions.json
  def index
    collection = App::StatusInteraction.by_client(get_client_id).order(:name)
    @pagy,  @app_status_interactions = set_pagy(collection)
  end

  # GET /app/status_interactions/1 or /app/status_interactions/1.json
  def show
  end

  # GET /app/status_interactions/new
  def new
    @app_status_interaction = App::StatusInteraction.new
  end

  # GET /app/status_interactions/1/edit
  def edit
  end

  # POST /app/status_interactions or /app/status_interactions.json
  def create
    @app_status_interaction = App::StatusInteraction.new(app_status_interaction_params)
    set_client_id(@app_status_interaction)

    if @app_status_interaction.save
      flash[:success] = t('views.app.general.flash.create_m', model: App::StatusInteraction.model_name.human)
      redirect_to app_status_interaction_url(@app_status_interaction)
    else
        render :new, status: :unprocessable_entity 
    end
  end

  # PATCH/PUT /app/status_interactions/1 or /app/status_interactions/1.json
  def update
    if @app_status_interaction.update(app_status_interaction_params)
      flash[:success] = t('views.app.general.flash.update_m', model: App::StatusInteraction.model_name.human)
      redirect_to app_status_interaction_url(@app_status_interaction)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /app/status_interactions/1 or /app/status_interactions/1.json
  def destroy
    if @app_status_interaction.has_dependency?
      flash[:error] = t('views.app.general.flash.destroy_failed_m', model: App::StatusInteraction.model_name.human)
      redirect_to @app_status_interaction
    else
      @app_status_interaction.destroy
      flash[:success] = t('views.app.general.flash.destroy_m', model: App::StatusInteraction.model_name.human)
      redirect_to app_status_interactions_path
    end
  end

  #  GET /app/calendars/search?query=:query&status=:status
  def search 

    collection = App::StatusInteraction.by_client(get_client_id)

    collection = collection.by_status_interaction_status(params[:status])
    collection = collection.search(params[:query].to_s) if params[:query].present?

    @pagy,  @app_status_interactions = set_pagy(collection)
    
    render :index

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app_status_interaction
      @app_status_interaction = App::StatusInteraction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def app_status_interaction_params
      params.require(:app_status_interaction).permit(:name, :active, :icon, :style, :color)
    end

    def set_form_variables
      @styles = App::StatusInteraction::STYLES.map{ |style| [style, t("activerecord.options.general.STYLE.#{style}")]}
    end
end
