class App::VendorsController < ApplicationController
  before_action :set_app_vendor, only: %i[ show edit update destroy ]

  # GET /app/vendors or /app/vendors.json
  def index
    @app_vendors = App::Vendor.all
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

    respond_to do |format|
      if @app_vendor.save
        format.html { redirect_to app_vendor_url(@app_vendor), notice: "Vendor was successfully created." }
        format.json { render :show, status: :created, location: @app_vendor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @app_vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /app/vendors/1 or /app/vendors/1.json
  def update
    respond_to do |format|
      if @app_vendor.update(app_vendor_params)
        format.html { redirect_to app_vendor_url(@app_vendor), notice: "Vendor was successfully updated." }
        format.json { render :show, status: :ok, location: @app_vendor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @app_vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /app/vendors/1 or /app/vendors/1.json
  def destroy
    @app_vendor.destroy

    respond_to do |format|
      format.html { redirect_to app_vendors_url, notice: "Vendor was successfully destroyed." }
      format.json { head :no_content }
    end
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
