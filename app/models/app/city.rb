class App::City < ApplicationRecord
  belongs_to :client, class_name: 'App::Client'
  has_and_belongs_to_many :vendors, class_name: 'App::Vendor', join_table: 'app_cities_vendors'
  has_many :institutions, class_name: 'App::Institution'

  # Scopes
  include App::Scopes
  scope :by_id, ->(id) { where(id: id) }
  scope :with_institutions, -> { joins(:institutions).distinct }
end
