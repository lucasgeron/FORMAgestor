class App::InstitutionsController < ApplicationController
  before_action :authenticate_user_or_admin! 
  before_action :check_client_id, only: %i[ show edit update destroy]
  before_action :set_app_institution, only: %i[ show edit update destroy destroy_attachment ]
  before_action :set_content_for_sidebar, only: %i[ index search ]
  before_action :set_content_for_form, only: %i[ new create edit update ]

  # GET /app/institutions or /app/institutions.json
  def index
    if current_access_is_user? && get_current_access.vendor && get_current_access.vendor.cities.any?
      @app_cities = get_current_access.vendor.cities.order(:name)
      collection = App::Institution.by_client(get_client_id).by_city(@app_cities).order(:abreviation)
    else
      collection = App::Institution.none
      @app_cities = App::City.none
    end
    @pagy, @app_institutions = set_pagy(collection)
    set_variables_for_sidebar(collection)
  end
    
  # GET /app/institutions/1 or /app/institutions/1.json
  def show
    @courses = @app_institution.courses.order(:name) if @app_institution.courses.any?
  end

  # GET /app/institutions/new
  def new
    @app_institution = App::Institution.new(city_id: params[:city_id])
  end

  # GET /app/institutions/1/edit
  def edit
  end

  # POST /app/institutions or /app/institutions.json
  def create
    @app_institution = App::Institution.new(app_institution_params)
    set_client_id(@app_institution)

    if @app_institution.save
      flash[:success] = t('views.app.general.flash.create_f', model: App::Institution.model_name.human)
      redirect_to app_institution_url(@app_institution)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /app/institutions/1 or /app/institutions/1.json
  def update
    if @app_institution.update(app_institution_params)
      flash[:success] = t('views.app.general.flash.update_f', model: App::Institution.model_name.human)
      redirect_to app_institution_url(@app_institution)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /app/institutions/1 or /app/institutions/1.json
  def destroy
    if @app_institution.has_dependency?
      flash[:error] = t('views.app.general.flash.destroy_failed_f', model: App::Institution.model_name.human)
      redirect_to @app_institution
    else
      @app_institution.destroy
      flash[:success] = t('views.app.general.flash.destroy_f', model: App::Institution.model_name.human)
      redirect_to app_institutions_url
    end
  end

  # DELETE /clients/1/destroy_attachment
  def destroy_attachment
    if @app_institution.image.attached? 
      @app_institution.image.purge
      flash[:success] = t('views.app.general.flash.destroy_f', model: t('activerecord.attributes.app/institution.image'))
      redirect_to app_institution_path(@app_institution)
    else 
      flash.now[:error] = t('views.app.institution.flash.destroy_attachment_failed_f', model: t('activerecord.attributes.app/institution.image'))
      render :edit, status: :unprocessable_entity
    end
  end

   #  GET /app/institutions/search?query=:query&city_ids=:city_ids
   def search 
    
    collection = App::Institution.by_client(get_client_id).order(:abreviation)

    if params[:query].present?  
      collection = collection.search(params[:query])
      params[:city_ids] = collection.pluck(:city_id).uniq # set the city_ids to the search result
    elsif params[:city_ids].present?
      collection = collection.by_city(params[:city_ids])
    else
      return redirect_to app_institutions_path 
    end
    
    @pagy, @app_institutions = set_pagy(collection)
    set_variables_for_sidebar(collection)
    @app_cities = App::City.by_client(get_client_id).by_id(collection.pluck(:city_id)).order(:name)

    render :index

  end


  private

    # Use callbacks to share common setup or constraints between actions.
    def set_app_institution
      @app_institution = App::Institution.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def app_institution_params
      params.require(:app_institution).permit(:name, :abreviation, :city_id, :image)
    end

  
  def set_content_for_sidebar
    @cities = App::City.by_client(get_client_id).joins(:institutions).distinct.order(:name)
  end

  def set_variables_for_sidebar(collection)
    @city_ids = collection.pluck(:city_id).uniq
  end

  def set_content_for_form
    @cities = App::City.by_client(get_client_id).order(:name)
  end
 

end
