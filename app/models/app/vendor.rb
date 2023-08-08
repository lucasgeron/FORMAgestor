class App::Vendor < ApplicationRecord
  belongs_to :client, class_name: 'App::Client'
  has_and_belongs_to_many :cities, class_name: 'App::City', join_table: 'app_cities_vendors'
  has_one :user, class_name: 'App::User'
  has_many :prospects, class_name: 'App::Prospect'


  # Validations
  validates :client_id, presence: true
  validates :name, presence: true
  validates :role, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}, allow_blank: true
  

  # Scopes
  include App::Scopes
  scope :search, -> (search) { where("LOWER(UNACCENT(name)) LIKE LOWER(UNACCENT(:search)) OR 
                                      LOWER(UNACCENT(role)) LIKE LOWER(UNACCENT(:search))", search: "%#{search}%") }

  
end
