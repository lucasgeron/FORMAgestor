class App::VendorsController < ApplicationController
  
  before_action :authenticate_user_or_admin!
  before_action :check_client_id, only: %i[ show edit update destroy]  
  before_action :set_app_vendor, only: %i[ show edit update destroy ]
  
  # GET /app/vendors or /app/vendors.json
  def index
    @app_vendors = App::Vendor.by_client(get_client_id)
  end

  # GET /app/vendors/1 or /app/vendors/1.json
  def show
  end

  # GET /app/vendors/new
  def new
    @app_vendor = App::Vendor.new
  end

  # GET /app/vendors/1/edit
  def edit
  end

  # POST /app/vendors or /app/vendors.json
  def create
    @app_vendor = App::Vendor.new(app_vendor_params)
    set_client_id(@app_vendor)

    if @app_vendor.save
      flash[:success] = t('views.app.general.flash.create', model: App::Vendor.model_name.human)
      redirect_to app_vendor_url(@app_vendor)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /app/vendors/1 or /app/vendors/1.json
  def update
    if @app_vendor.update(app_vendor_params)
      flash[:success] = t('views.app.general.flash.update', model: App::Vendor.model_name.human)
      redirect_to app_vendor_url(@app_vendor)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /app/vendors/1 or /app/vendors/1.json
  def destroy
    @app_vendor.destroy
    flash[:success] = t('views.app.general.flash.destroy', model: App::Vendor.model_name.human)
    redirect_to app_vendors_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app_vendor
      @app_vendor = App::Vendor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def app_vendor_params
      params.require(:app_vendor).permit(:name, :phone, :email, :role, city_ids: [])
    end
end