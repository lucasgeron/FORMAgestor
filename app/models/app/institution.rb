class App::Institution < ApplicationRecord
  belongs_to :city, class_name: 'App::City'
  belongs_to :client, class_name: 'App::Client'
  has_one_attached :image
  has_many :courses, class_name: 'App::Course'

  # Validations
  validates :image, content_type: { in: [:png, :jpg, :jpeg], message: 'is not a valid content type' }

  validates :image, size: { less_than: 750.kilobyte , message: 'is too large' }
  
  
  # Scope
  include App::Scopes
  scope :by_city, ->(city_id) { where(city_id: city_id) }
  scope :by_id, ->(id) { where(id: id)}

  scope :search, -> (search) { where("LOWER(UNACCENT(abreviation)) LIKE LOWER(UNACCENT(:search))", search: "%#{search}%") }


  # Methods
  def has_dependency?
    false
  end

  def abreviation_and_city
    "#{abreviation} - #{city.name}"
  end

end
