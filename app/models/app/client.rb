class App::Client < ApplicationRecord
  
  # Associations
  has_many :admins, class_name: 'App::Admin'
  has_many :users, class_name: 'App::User'
  has_many :cities, class_name: 'App::City'
  has_many :vendors, class_name: 'App::Vendor'
  has_many :prospects, class_name: 'App::Prospect'

  has_one_attached :image

  before_validation :generate_slug
  
  # Validations
  validates :name, presence: true
  validates :cnpj, presence: true
  validates :slug, uniqueness: true

  # Scopes
  scope :only_active, -> { where(active: true) }
  # scope :inactive, -> { where(status: false) }

  
  # Methods
  def available_licenses
    self.licenses - self.users.only_active.count
  end

  def used_licenses
    self.users.only_active.count
  end

  # generate slug based on name
  def generate_slug
    self.slug = name.parameterize
  end

end
