class App::Client < ApplicationRecord
  
  # Associations
  has_many :admins, class_name: 'App::Admin'
  has_many :users, class_name: 'App::User'
  has_many :cities, class_name: 'App::City'
  has_many :vendors, class_name: 'App::Vendor'
  has_many :prospects, class_name: 'App::Prospect'
  has_many :institutions, class_name: 'App::Institution'

  has_one_attached :image

  before_validation :generate_slug
  
  # Validations
  validates :name, presence: true, uniqueness: true
  validates :cnpj, presence: true
  validates :slug, uniqueness: true

  # Scopes
  # scope :only_active, -> { where(active: true) }
  # scope :inactive, -> { where(status: false) }
  scope :by_client_status, -> (status) do 
    case status
    when 'active'
      where(active: true)
    when 'not_active'
      where(active: false)
    end
  end

  scope :search, -> (search) { where("LOWER(UNACCENT(name)) LIKE LOWER(UNACCENT(:search)) OR 
                                      LOWER(UNACCENT(cnpj)) LIKE LOWER(UNACCENT(:search))", search: "%#{search}%") }

  
  # Methods
  def available_licenses
    self.licenses - self.users.by_user_status('active').count
  end

  def used_licenses
    self.users.by_user_status('active').count
  end

  # generate slug based on name
  def generate_slug
    self.slug = name.parameterize
  end



end
