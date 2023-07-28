class App::Vendor < ApplicationRecord
  belongs_to :client, class_name: 'App::Client'
  has_and_belongs_to_many :cities, class_name: 'App::City', join_table: 'app_cities_vendors'
end
