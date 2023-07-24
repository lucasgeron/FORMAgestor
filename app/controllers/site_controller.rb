class SiteController < ApplicationController
  include ActionView::RecordIdentifier

  before_action :set_locale


  layout 'site'

  def index
    # flash.now[:success] = "This is a success message"
    # flash.now[:error] = "This is a error message"
    # flash.now[:warning] = "This is a warning message"
    # flash.now[:info] = "This is a info message"
    # flash.now[:message] = "This is a message"

    @subscriber = Subscriber.new
    # Recover the form data (if any) from the session, and then, remove the data from the session
    @subscriber.email = session.delete(:subscriber_email) if session.key?(:subscriber_email)
    
    @contact_form = ContactForm.new
    # Recover the form data (if any) from the session, and then, remove the data from the session
    @contact_form.email = session.delete(:contact_form_email) if session.key?(:contact_form_email)
    @contact_form.subject = session.delete(:contact_form_subject) if session.key?(:contact_form_subject)
    @contact_form.message = session.delete(:contact_form_message) if session.key?(:contact_form_message)

    # redirect_to root_path(locale: I18n.locale, anchor: 'newsletter')

  end

  # POST /toogle_locale
  def toogle_locale
    I18n.locale = params[:locale] || I18n.default_locale
    session[:locale] = I18n.locale
    flash[:info] = t('views.site.language_switched')
    redirect_to request.referrer || root_path
  end

  # POST /subscribe
  def subscribe_to_newsletter
    
    # set the current locale before save
    params[:subscriber][:locale] = I18n.locale.to_s

    @subscriber = Subscriber.new(subscriber_params)

    respond_to do |format|
      if @subscriber.save
        # Send email to subscriber
        SiteMailer.with(subscriber: @subscriber).subscribed_successfully.deliver_later
        flash[:success] = t('views.site.newsletter.subscribed_successfully', email: @subscriber.email)
      else
        # Save the form data in the session
        session[:subscriber_email] = params[:subscriber][:email]
        flash[:error] = @subscriber.errors.full_messages.join(", ") 
      end

      format.html { redirect_to root_path }
    end

  end


  # GET /unsubscribe/
  def unsubscribe_confirm
    @subscriber = Subscriber.find_by(email: params[:email])
    if @subscriber.nil?
      flash[:error] = t('views.site.newsletter.subscriber_not_found', email: params[:email])
      redirect_to root_path
    else
      render 'site/unsubscribe', locals: { subscriber: @subscriber }
    end
  
  end

  # POST /unsubscribe/
  def unsubscribe_to_newsletter
    # abort params[:subscriber][:email].inspect
    subscriber = Subscriber.find_by(email: params[:subscriber][:email])
    if subscriber
      subscriber.destroy
      flash[:success] = t('views.site.newsletter.unsubscribed_successfully', email: subscriber[:email])
      redirect_to root_path
    else
      flash[:error] = t('views.site.newsletter.unsubscribed_unsuccessfully', email: params[:subscriber][:email])
      redirect_to root_path
    end
  end

  


  # POST /contact_forms
  def contact_forms
    
    @contact_form = ContactForm.new(contact_form_params)

    respond_to do |format|
      if @contact_form.valid?
        # Send email to admin
        SiteMailer.with(email: @contact_form.email, subject: @contact_form.subject, message: @contact_form.message).new_message.deliver_later
        flash[:success] = t('views.site.contact.created_successfully')
      else
        # Save the form data in the session
        session[:contact_form_email] = params[:contact_form][:email]
        session[:contact_form_subject] = params[:contact_form][:subject]
        session[:contact_form_message] = params[:contact_form][:message]
        flash[:error] = @contact_form.errors.full_messages 
      end

      format.html { redirect_to root_path }
    end

  end

  private

  def set_locale
    I18n.locale = session[:locale] || I18n.default_locale
  end

  # Only allow a list of trusted parameters through.
  def subscriber_params
    params.require(:subscriber).permit(:email, :locale)
  end

  def contact_form_params
    params.require(:contact_form).permit(:email, :subject, :message)
  end

end
