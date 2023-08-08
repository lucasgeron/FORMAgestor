class App::InstitutionsController < ApplicationController
  before_action :authenticate_user_or_admin! 
  before_action :check_client_id, only: %i[ show edit update destroy]
  before_action :set_app_institution, only: %i[ show edit update destroy destroy_attachment ]
  before_action :set_content_for_sidebar, only: %i[ index search ]

  # GET /app/institutions or /app/institutions.json
  def index
    if current_access_is_user? && get_current_access.vendor && get_current_access.vendor.cities.any?
      @app_cities = get_current_access.vendor.cities.order(:name)
      collection = App::Institution.by_client(get_client_id).by_city(@app_cities.ids).order(:abreviation)
    else #CODE TO VALIDATE IF THERE'S A VENDOR
      collection = App::Institution.none
      @app_cities = App::City.none
    end
    @pagy, @app_institutions = set_pagy(collection)
  end
    

  # GET /app/institutions/1 or /app/institutions/1.json
  def show
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

    respond_to do |format|
      if @app_institution.save
        format.html { redirect_to app_institution_url(@app_institution), notice: "Institution was successfully created." }
        format.json { render :show, status: :created, location: @app_institution }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @app_institution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /app/institutions/1 or /app/institutions/1.json
  def update
    respond_to do |format|
      if @app_institution.update(app_institution_params)
        format.html { redirect_to app_institution_url(@app_institution), notice: "Institution was successfully updated." }
        format.json { render :show, status: :ok, location: @app_institution }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @app_institution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /app/institutions/1 or /app/institutions/1.json
  def destroy
    @app_institution.destroy

    respond_to do |format|
      format.html { redirect_to app_institutions_url, notice: "Institution was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  
  # DELETE /clients/1/destroy_attachment
  def destroy_attachment
    if @app_institution.image.attached? 
      @app_institution.image.purge
      flash[:success] = t('views.app.general.flash.destroy', model: t('activerecord.attributes.app/institution.image'))
      redirect_to app_institution_path(@app_institution)
    else 
      flash.now[:error] = t('views.app.institution.flash.destroy_attachment_failed', model: t('activerecord.attributes.app/institution.image'))
      render :edit, status: :unprocessable_entity
    end
  end

   #  GET /app/prospects/search?query=:query&status=:status
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
end
