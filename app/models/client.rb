class Client < ApplicationRecord
  # Associations
  has_many :users

  # Validations
  # validates :name, presence: true
  # validates :status, presence: true

  # Scopes
  # scope :active, -> { where(status: true) }
  # scope :inactive, -> { where(status: false) }


  def has_available_license?
    self.licenses > self.users.active.count
  end

  def available_licenses
    self.licenses - self.users.active.count
  end

  def used_licenses
    self.users.active.count
  end



end
