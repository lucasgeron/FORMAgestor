class App::City < ApplicationRecord
  belongs_to :client, class_name: 'App::Client'
  has_and_belongs_to_many :vendors, class_name: 'App::Vendor', join_table: 'app_cities_vendors'
  has_many :institutions, class_name: 'App::Institution'
  has_many :courses, class_name: 'App::Course', through: :institutions

  # Through Associations
  has_many :negotiations, through: :institutions
  has_many :courses, through: :institutions

  # Validations
  validates :name, :state,  presence: true
  validates_uniqueness_of :name, scope: :client_id
  
  # Scopes
  include App::Scopes

  scope :by_negotiation, ->(negotiation_ids) { joins(:negotiations).where(negotiations: {id: negotiation_ids}) }
  scope :by_course, ->(course_ids) { joins(:courses).where(courses: {id: course_ids}) }
  scope :by_uf, ->(uf) { where(state: uf) }
  scope :search, -> (search) { where("LOWER(UNACCENT(name)) LIKE LOWER(UNACCENT(:search))", search: "%#{search}%") }


  # Methods
  def has_dependency?
    self.institutions.any?
  end

  def name_and_uf
    "#{self.name} - #{self.state}"
  end


end
