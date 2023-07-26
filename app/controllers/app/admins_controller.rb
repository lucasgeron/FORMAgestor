class App::AdminsController < ApplicationController

  before_action :authenticate_admin!
  before_action :set_admin, only: [:update]


   # PATCH/PUT /app/admins/1 or /app/updates/1.json
   def update
    if @app_admin.update_without_password(app_admin_params)
      flash[:success] = t('views.app.admins.flash.update_client', client: @app_admin.client.name)
      redirect_to request.referrer 
    else
      render :edit, status: :unprocessable_entity 
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_admin
      @app_admin = App::Admin.find(params[:id])
  end

  def app_admin_params
    params.require(:app_admin).permit(:client_id)
  end


end
