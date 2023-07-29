class App::User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  belongs_to :client, class_name: 'App::Client'
  belongs_to :vendor, class_name: 'App::Vendor', optional: true

  # Validations
  validates :email, uniqueness: true # devise valide emails by defauld
  validates :client_id, presence: true
  validates :password, presence: true, on: :create
  validates :password_confirmation, presence: true, on: :create
  
  validates :vendor_id, uniqueness: true, allow_nil: true
  validate :vendor_client_id_matches_user_client_id
  
  # when try vendor_id to be from other client
  def vendor_client_id_matches_user_client_id
    if vendor && vendor.client_id != client_id
      errors.add(:vendor_id, I18n.t('activerecord.errors.messages.vendor_client_id_matches_user_client_id'))
    end
  end


  # Scopes
  include App::Scopes
  scope :only_active, -> { where(active: true) }
end
