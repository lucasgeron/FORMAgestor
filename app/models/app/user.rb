class App::User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  belongs_to :client, class_name: 'App::Client'

  # Validations
  validates :email, uniqueness: true # devise valide emails by defauld
  validates :client_id, presence: true
  validates :password, presence: true, on: :create
  validates :password_confirmation, presence: true, on: :create
  
  # Scopes
  scope :by_client, ->(client_id) { where(client_id: client_id) }
  scope :only_active, -> { where(active: true) }
end
