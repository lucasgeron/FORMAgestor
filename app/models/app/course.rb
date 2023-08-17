class App::Course < ApplicationRecord
  belongs_to :institution, class_name: 'App::Institution'
  belongs_to :client, class_name: 'App::Client'
  has_many :negotiations, class_name: 'App::Negotiation'


  # Validations
  validates :name, :duration, presence: true
  validates_uniqueness_of :name, scope: [:client_id, :institution_id], message: I18n.t('views.app.general.flash.course_already_exists')
  validates :duration , numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 20 }

   # Scope
   include App::Scopes
   scope :by_institution, ->(institution_id) { where(institution_id: institution_id) }
   scope :by_city, ->(city_id) { joins(:institution).where(app_institutions: { city_id: city_id }) }
   scope :search, -> (search) { where("LOWER(UNACCENT(app_courses.name)) LIKE LOWER(UNACCENT(:search))", search: "%#{search}%") }

  #  Methods
  def has_dependency?
    self.negotiations.any?
  end

end
