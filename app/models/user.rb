class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  belongs_to :client

  # Validations
  validates :email, presence: true, uniqueness: true
  validates :client_id, presence: true
  
  # Scopes
  scope :by_client, ->(client_id) { where(client_id: client_id) }
  scope :active, -> { where(active: true) }
end
