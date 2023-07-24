Rails.application.config.action_mailer.default_url_options = { host: ENV.fetch('mailer.host', nil),
                                                               port: ENV.fetch('mailer.port', nil) }


Rails.application.config.action_mailer.delivery_method = :smtp

ActionMailer::Base.smtp_settings = {
  address: ENV.fetch('mailer.smtp.address', nil),
  port: ENV.fetch('mailer.smtp.port', nil),
  user_name: ENV.fetch('mailer.smtp.username', nil),
  password: ENV.fetch('mailer.smtp.password', nil),
  authentication: ENV.fetch('mailer.smtp.authentication', nil),
  enable_starttls_auto: ENV.fetch('mailer.smtp.enable_starttls_auto', nil)
}