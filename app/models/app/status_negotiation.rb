class App::StatusNegotiation < ApplicationRecord
  belongs_to :client, class_name: 'App::Client'
  has_many :negotiations, class_name: 'App::Negotiation'

  # Constants
  COLORS = %w[default red amber orange yellow lime green emerald teal cyan sky indigo violet purple fuchsia pink rose ].freeze
  STYLES = %w[fa-solid fa-regular fa-brands].freeze

  # Scope
  include App::Scopes
  scope :search, -> (search) { where("LOWER(UNACCENT(name)) LIKE LOWER(UNACCENT(:search))", search: "%#{search}%") }
  scope :by_status_negotiation_status, -> (status) do 
    case status
      when 'active'
        where(active: true)
      when 'not_active'
        where(active: false)
    end
  end


  #  Methods
  def has_dependency?
    false
  end
end
