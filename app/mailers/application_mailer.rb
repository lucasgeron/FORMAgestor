class ApplicationMailer < ActionMailer::Base
  default from: ENV.fetch('mailer.smtp.username')
  layout 'mailer'
end
