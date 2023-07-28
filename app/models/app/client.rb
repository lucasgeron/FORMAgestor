class App::Client < ApplicationRecord
  # Associations
  
  has_many :admins, class_name: 'App::Admin'
  has_many :users, class_name: 'App::User'
  has_many :cities, class_name: 'App::City'
  has_many :vendors, class_name: 'App::Vendor'

  # Validations
  validates :name, presence: true
  validates :cnpj, presence: true

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

end
