class App::StatusInteraction < ApplicationRecord
  belongs_to :client, class_name: 'App::Client'
  has_many :interactions, class_name: 'App::Interaction', foreign_key: 'status_id'

  # Constants
  COLORS = %w[default red orange amber yellow lime green emerald teal cyan sky blue indigo violet purple fuchsia pink rose ].freeze
  STYLES = %w[fa-solid fa-regular fa-brands].freeze

  # Validations
  validates :name, presence: true, uniqueness: { scope: :client_id }

  # Scope
  include App::Scopes
  scope :search, -> (search) { where("LOWER(UNACCENT(name)) LIKE LOWER(UNACCENT(:search))", search: "%#{search}%") }
  scope :by_status_interaction_status, -> (status) do 
    case status
      when 'active'
        where(active: true)
      when 'not_active'
        where(active: false)
    end
  end


  #  Methods
  def has_dependency?
    self.interactions.any?
  end
end
