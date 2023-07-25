require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  
    # Load application.yml file
    ENV.update YAML.load_file('config/application.yml')[Rails.env] rescue {}

    # Setup Ngrok Free
    config.hosts << "#{ENV['ngrok.host']}.ngrok-free.app"

    # Set default locale
    config.i18n.available_locales = [:'pt-BR', :en]
    config.i18n.default_locale = :'pt-BR'
    # config.i18n.default_locale = :en

    # set layouts for devise
    config.to_prepare do
      Devise::SessionsController.layout "public_application"
      Devise::RegistrationsController.layout "public_application"
      Devise::ConfirmationsController.layout "public_application"
      Devise::UnlocksController.layout "public_application"
      Devise::PasswordsController.layout "public_application"
    end
    


  end
end
