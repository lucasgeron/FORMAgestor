class App::City < ApplicationRecord
  belongs_to :client, class_name: 'App::Client'
  has_and_belongs_to_many :vendors, class_name: 'App::Vendor', join_table: 'app_cities_vendors'

  # Scopes
  include App::Scopes

end
