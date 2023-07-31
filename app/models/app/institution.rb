class App::Institution < ApplicationRecord
  belongs_to :city, class_name: 'App::City'
  belongs_to :client, class_name: 'App::Client'
  has_one_attached :image


  # Scope
  include App::Scopes
  scope :by_city, ->(city_id) { where(city_id: city_id) }

end
