class Client < ApplicationRecord
  # Associations
  has_many :users

  # Validations
  validates :name, presence: true
  validates :cnpj, presence: true

  # Scopes
  scope :only_active, -> { where(active: true) }
  # scope :inactive, -> { where(status: false) }


  def has_available_license?
    self.licenses > self.users.only_active.count
  end

  def available_licenses
    self.licenses - self.users.only_active.count
  end

  def used_licenses
    self.users.only_active.count
  end

end
