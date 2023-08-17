class App::Course < ApplicationRecord
  belongs_to :institution, class_name: 'App::Institution'
  belongs_to :client, class_name: 'App::Client'
  has_many :negotiations, class_name: 'App::Negotiation'


   # Scope
   include App::Scopes
   scope :by_institution, ->(institution_id) { where(institution_id: institution_id) }
   scope :by_city, ->(city_id) { joins(:institution).where(app_institutions: { city_id: city_id }) }
   scope :search, -> (search) { where("LOWER(UNACCENT(app_courses.name)) LIKE LOWER(UNACCENT(:search))", search: "%#{search}%") }

  
   

  #  Methods
  def has_dependency?
    false
  end

end
