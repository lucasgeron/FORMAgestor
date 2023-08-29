class App::Calendar < ApplicationRecord
  belongs_to :client, class_name: 'App::Client'
  has_many :negotiations, class_name: 'App::Negotiation', dependent: :destroy

  # Through Associations
  has_many :contacts, class_name: 'App::Contact', through: :negotiations
  has_many :interactions, class_name: 'App::Interaction', through: :negotiations

  # Validations
  validates :year, presence: true, uniqueness: { scope: [:semester, :client_id] }
  validates :year, numericality: { only_integer: true, greater_than_or_equal_to: Date.today.year, less_than_or_equal_to: Date.today.year + 10 }
  validates :semester, presence: true, uniqueness: { scope: [:year, :client_id] }
  validates :semester, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 2}

   # Scopes
   include App::Scopes
   scope :by_calendar_status, -> (status) do 
      case status
        when 'active'
          where(active: true)
        when 'not_active'
          where(active: false)
      end
    end

    scope :search, -> (search) {
      search_as_integer = search.to_i
      where("year = :search OR CAST(year AS TEXT) LIKE :search_string", search: search_as_integer, search_string: "%#{search}%")
    }

  #  Methods
  def name 
    "#{year} / #{semester}"
  end

  def has_dependency?
    self.interactions.any? || self.contacts.any?
  end

end
