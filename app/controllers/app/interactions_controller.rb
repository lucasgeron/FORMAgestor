class App::InteractionsController < ApplicationController
  before_action :set_app_interaction, only: %i[ show edit update destroy ]
  before_action :set_filters_for_form, only: %i[ new create edit update ]
  before_action :set_content_for_sidebar, only: %i[ index search ]

  # GET /app/interactions or /app/interactions.json
  def index
    if current_access_is_user? && get_current_access.vendor 
      collection = App::Interaction.by_client(get_client_id).by_vendor(get_current_access.vendor_id).includes(:vendor, :status, negotiation: { course: {institution: :city }}).order(created_at: :desc ) 
    else
      collection = App::Interaction.none 
    end
    @pagy,  @app_interactions = pagy(collection)
    set_variables_for_sidebar(collection)

    @collection_src_url = 'app_interactions_url'

    respond_to do |format|
      format.html  
      format.turbo_stream 
    end
    
  end

  # GET /app/interactions/1 or /app/interactions/1.json
  def show
  end

  # GET /app/interactions/new
  def new
    @app_interaction = App::Interaction.new
  end

  # GET /app/interactions/1/edit
  def edit
  end

  # POST /app/interactions or /app/interactions.json
  def create
    @app_interaction = App::Interaction.new(app_interaction_params)
    set_client_id(@app_interaction)

    if @app_interaction.save
      flash[:success] = t('views.app.general.flash.create_f', model: App::Interaction.model_name.human)
      redirect_to app_interaction_url(@app_interaction)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /app/interactions/1 or /app/interactions/1.json
  def update
    if @app_interaction.update(app_interaction_params)
      flash[:success] = t('views.app.general.flash.update_f', model: App::Interaction.model_name.human)
      redirect_to app_interaction_url(@app_interaction)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /app/interactions/1 or /app/interactions/1.json
  def destroy
    @app_interaction.destroy
    flash[:success] = t('views.app.general.flash.destroy_f', model: App::Interaction.model_name.human)
    redirect_to app_interactions_url
  end

  #  GET /app/interactions/search?query=:query&status_ids=:status&vendors_ids=:vendors
  def search 
    collection = App::Interaction.by_client(get_client_id).includes(:vendor, :status, negotiation: { course: {institution: :city }})
    

    if params[:query].present? || params[:status_ids].present? || params[:vendor_ids].present?
      collection = collection.search(params[:query]) if params[:query].present?
      collection = collection.by_status_interaction(params[:status_ids]) if params[:status_ids].present?
      collection = collection.by_vendor(params[:vendor_ids]) if params[:vendor_ids].present?
    else
      return redirect_to app_interactions_path
    end

    @pagy,  @app_interactions = pagy(collection.order(created_at: :desc))
    set_variables_for_sidebar(collection)
    @collection_src_url = 'search_app_interactions_path'
    
    
    respond_to do |format|
      format.html do
        render  "app/interactions/index"
      end
      format.turbo_stream do
        render  "app/interactions/index",
                locals: { collection: @app_interactions, collection_name: "interactions"}
      end
    end


  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app_interaction
      @app_interaction = App::Interaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def app_interaction_params
      params.require(:app_interaction).permit(:client_id, :vendor_id, :negotiation_id, :status_id, :description)
    end

    def set_filters_for_form
      @institutions = App::Institution.by_client(get_client_id).order(:abreviation)
      if @app_interaction.present? && @app_interaction.negotiation.present?
        @courses = App::Course.by_client(get_client_id).by_institution(@app_interaction.negotiation.course.institution_id).order(:name)
        @negotiations = App::Negotiation.by_client(get_client_id).by_course(@app_interaction.negotiation.course_id)
      else
        @courses = []
        @negotiations = []
      end
    end

    def set_content_for_sidebar
      @status = App::StatusInteraction.by_client(get_client_id).order(:name)
      @vendors = App::Vendor.by_client(get_client_id).order(:name)
    end

    def set_variables_for_sidebar(collection)
      @vendors_ids = collection.pluck(:vendor_id).uniq
    end
      
end
