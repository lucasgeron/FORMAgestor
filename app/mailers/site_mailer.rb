class SiteMailer < ApplicationMailer

  def new_message
    @contact_form = ContactForm.new(email: params[:email], subject: params[:subject], message: params[:message])
    mail(to: ENV.fetch('mailer.to'), subject: @contact_form.subject)
  end

  def subscribed_successfully
    # @subscriber = params[:subscriber]
    mail(to: params[:email], subject: t('mailer.site.subscribed_successfully.subject') )
  end

end
