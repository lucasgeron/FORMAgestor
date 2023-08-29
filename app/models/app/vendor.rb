class App::Vendor < ApplicationRecord
  belongs_to :client, class_name: 'App::Client'
  belongs_to :role, class_name: 'App::RoleVendor', optional: true

  has_and_belongs_to_many :cities, class_name: 'App::City', join_table: 'app_cities_vendors'
  has_one :user, class_name: 'App::User'
  has_many :prospects, class_name: 'App::Prospect'
  has_many :negotiations, class_name: 'App::Negotiation'


  # Validations
  validates :client_id, presence: true
  validates :name, presence: true, uniqueness: { scope: :client_id }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}, allow_blank: true
  
  # Scopes
  include App::Scopes
  scope :search, -> (search) { where("LOWER(UNACCENT(name)) LIKE LOWER(UNACCENT(:search))", search: "%#{search}%") }
  
  scope :by_role, ->(role_id) do
    # return where(role_id: role_id) 
    if role_id.is_a?(App::Vendor)
      where(role_id: role_id)
    elsif role_id.include?('-1') # Se o array de role_id incluir uma string vazia
      where(role_id: [nil] + role_id.reject(&:empty?)) # Inclui nil e os outros ids não vazios
    else
      where(role_id: role_id.reject(&:empty?))
    end
  end
  
end
