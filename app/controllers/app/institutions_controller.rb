class App::InstitutionsController < ApplicationController
  before_action :set_app_institution, only: %i[ show edit update destroy destroy_attachment ]

  # GET /app/institutions or /app/institutions.json
  def index
    @app_institutions = App::Institution.by_client(get_client_id)

    if current_access_is_user? && get_current_access.vendor
      @cities = get_current_access.vendor.cities
    else
      @cities = App::City.none
    end
  end
    

  # GET /app/institutions/1 or /app/institutions/1.json
  def show
  end

  # GET /app/institutions/new
  def new
    @app_institution = App::Institution.new
    @app_institution.city_id = params[:city_id] if params[:city_id]
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

  # GET /app/institutions/search
  def search
    @app_institutions = App::Institution.by_client(get_client_id)
    @cities = App::City.by_client(get_client_id).with_institutions.by_id(params[:city_ids]).order(:name)

    # respond_to do |format|
    #   format.turbo_stream do
    #     render turbo_stream: turbo_stream.replace('institutions', partial: "app/institutions/institutions")
    #   end
    # end
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
end
