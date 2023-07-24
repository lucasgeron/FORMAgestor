# Preview all emails at http://localhost:3000/rails/mailers/site_mailer
class SiteMailerPreview < ActionMailer::Preview
  
  def new_message
    SiteMailer.with(email: ENV.fetch('mailer.to'), subject: 'Assunto de Teste', message: 'Mensagem de teste').new_message
  end

  def subscribed_successfully
    params[:email] = ENV.fetch('mailer.to')        
    SiteMailer.with(email: params[:email]).subscribed_successfully
  end

end
