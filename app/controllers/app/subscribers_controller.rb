class App::SubscribersController < ApplicationController

  before_action :authenticate_admin!, except: %i[ create unsubscribe destroy ]
  before_action :set_app_subscriber, only: %i[ destroy ]

  # GET /app/subscribers or /app/subscribers.json
  def index
    @app_subscribers = App::Subscriber.all
  end

  # GET /app/subscribers/new
  def new
    @app_subscriber = App::Subscriber.new
  end

  # POST /app/subscribers or /app/subscribers.json
  def create
    # set the current locale before save
    params[:app_subscriber][:locale] = I18n.locale.to_s

    @app_subscriber = App::Subscriber.new(app_subscriber_params)

    # abort @app_subscriber.inspect

    if @app_subscriber.save
      SiteMailer.with(email: @app_subscriber.email).subscribed_successfully.deliver_later
      flash[:success] = t('views.site.newsletter.subscribed_successfully', email: @app_subscriber.email)
    else
      # Save the form data in the session
      session[:app_subscriber_email] = params[:app_subscriber][:email]
      flash[:error] = @app_subscriber.errors.full_messages.join(", ") 
    end
    redirect_to site_root_path

  end

  def unsubscribe
    @app_subscriber = App::Subscriber.find_by(email: params[:email])
    
    if @app_subscriber
      render 'site/unsubscribe', layout:'site', locals: { app_subscriber: @app_subscriber }
    else
      flash[:error] = t('views.site.newsletter.subscriber_not_found', email: params[:email])
      redirect_to site_root_path
    end
  end

  # DELETE /app/subscribers/1 or /app/subscribers/1.json
  def destroy
    @app_subscriber.destroy

      flash[:success] = t('views.site.newsletter.unsubscribed_successfully', email: @app_subscriber.email)
      current_admin ? redirect_to(app_subscribers_url) : redirect_to(site_root_path)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app_subscriber
      @app_subscriber = App::Subscriber.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def app_subscriber_params
      params.require(:app_subscriber).permit(:email, :locale)
    end
end
