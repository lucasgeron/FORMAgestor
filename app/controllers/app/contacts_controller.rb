class App::ContactsController < ApplicationController
  before_action :set_app_contact, only: %i[ show edit update destroy ]
  before_action :set_filters_for_form, only: %i[ new create edit update ]

  # GET /app/contacts or /app/contacts.json
  def index
    collection = App::Contact.by_client(get_client_id).order(:name)
    
    @pagy,  @app_contacts = pagy(collection)

    @collection_src_url = 'app_contacts_url'

    respond_to do |format|
      format.html  
      format.turbo_stream 
    end
    
  end

  # GET /app/contacts/1 or /app/contacts/1.json
  def show
  end

  # GET /app/contacts/new
  def new
    @app_contact = App::Contact.new(name: params[:name], phone: params[:phone], instagram: params[:instagram])
  end

  # GET /app/contacts/1/edit
  def edit
  end

  # POST /app/contacts or /app/contacts.json
  def create
    @app_contact = App::Contact.new(app_contact_params)
    set_client_id(@app_contact)

    if @app_contact.save
      flash[:success] = t('views.app.general.flash.create_m', model: App::Contact.model_name.human)
      redirect_to app_contact_url(@app_contact)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /app/contacts/1 or /app/contacts/1.json
  def update
    if @app_contact.update(app_contact_params)
      flash[:success] = t('views.app.general.flash.update_m', model: App::Contact.model_name.human)
      redirect_to app_contact_url(@app_contact)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /app/contacts/1 or /app/contacts/1.json
  def destroy
    if @app_contact.has_dependency?
      flash[:error] = t('views.app.general.flash.destroy_failed_m', model: App::Contact.model_name.human)
      redirect_to @app_contact
    else
      @app_contact.destroy
      flash[:success] = t('views.app.general.flash.destroy_m', model: App::Contact.model_name.human)
      redirect_to app_contacts_url
    end
  end

    #  GET /app/courses/search?query=:query&city_ids=:city_ids
    def search 

      collection = App::Contact.by_client(get_client_id)

      collection = collection.search(params[:query]) if params[:query].present?
  
      @pagy,  @app_contacts = pagy(collection.order(:name))
      
      @collection_src_url = 'search_app_contacts_path'
      
      respond_to do |format|
        format.html do
          render  "app/contacts/index"
        end
        format.turbo_stream do
          render  "app/contacts/index",
                  locals: { collection: @app_contacts, collection_name: "contacts"}
        end
      end
  
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app_contact
      @app_contact = App::Contact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def app_contact_params
      params.require(:app_contact).permit(:name, :phone, :instagram, :informant, :committee, :negotiation_id)
    end

    def set_filters_for_form
      @institutions = App::Institution.by_client(get_client_id).order(:abreviation)
      if @app_contact.present? && @app_contact.negotiation.present?
        @courses = App::Course.by_client(get_client_id).by_institution(@app_contact.negotiation.course.institution_id).order(:name)
        @negotiations = App::Negotiation.by_client(get_client_id).by_course(@app_contact.negotiation.course_id)
      else
        @courses = []
        @negotiations = []
      end
      
    end
end
