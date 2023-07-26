class App::SubscribersController < ApplicationController
  before_action :set_app_subscriber, only: %i[ destroy ]

  # GET /app/subscribers or /app/subscribers.json
  def index
    @app_subscribers = Subscriber.all
  end

  # DELETE /app/subscribers/1 or /app/subscribers/1.json
  def destroy
    @app_subscriber.destroy

    respond_to do |format|
      format.html { redirect_to app_subscribers_url, notice: "Subscriber was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app_subscriber
      @app_subscriber = Subscriber.find(params[:id])
    end

   
end
