class App::RoleVendorsController < ApplicationController
  before_action :set_app_role_vendor, only: %i[ show edit update destroy ]

  # GET /app/role_vendors or /app/role_vendors.json
  def index
    collection = App::RoleVendor.by_client(get_client_id).order(:name)
    @pagy,  @app_role_vendors = set_pagy(collection)
  end

  # GET /app/role_vendors/1 or /app/role_vendors/1.json
  def show
  end

  # GET /app/role_vendors/new
  def new
    @app_role_vendor = App::RoleVendor.new(active: true)
  end

  # GET /app/role_vendors/1/edit
  def edit
  end

  # POST /app/role_vendors or /app/role_vendors.json
  def create
    @app_role_vendor = App::RoleVendor.new(app_role_vendor_params)
    set_client_id(@app_role_vendor)

    if @app_role_vendor.save
      flash[:success] = t('views.app.general.flash.create_m', model: App::RoleVendor.model_name.human)
      redirect_to app_role_vendor_url(@app_role_vendor)
    else
        render :new, status: :unprocessable_entity 
    end
  end

  # PATCH/PUT /app/role_vendors/1 or /app/role_vendors/1.json
  def update
    if @app_role_vendor.update(app_role_vendor_params)
      flash[:success] = t('views.app.general.flash.update_m', model: App::RoleVendor.model_name.human)
      redirect_to app_role_vendor_url(@app_role_vendor)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /app/role_vendors/1 or /app/role_vendors/1.json
  def destroy
    if @app_role_vendor.has_dependency?
      flash[:error] = t('views.app.general.flash.destroy_failed_m', model: App::RoleVendor.model_name.human)
      redirect_to @app_role_vendor
    else
      @app_role_vendor.destroy
      flash[:success] = t('views.app.general.flash.destroy_m', model: App::RoleVendor.model_name.human)
      redirect_to app_role_vendors_path
    end
  end


   #  GET /app/role_vendors/search?query=:query&status=:status
   def search 

    collection = App::RoleVendor.by_client(get_client_id)

    collection = collection.by_role_vendor_status(params[:status])
    collection = collection.search(params[:query].to_s) if params[:query].present?

    @pagy,  @app_role_vendors = set_pagy(collection)
    
    render :index

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app_role_vendor
      @app_role_vendor = App::RoleVendor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def app_role_vendor_params
      params.require(:app_role_vendor).permit( :name, :active)
    end
end
