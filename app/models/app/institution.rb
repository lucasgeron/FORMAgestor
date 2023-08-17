class App::Institution < ApplicationRecord
  belongs_to :city, class_name: 'App::City'
  belongs_to :client, class_name: 'App::Client'
  has_many :courses, class_name: 'App::Course'
  has_one_attached :image

  # Through Associations
  has_many :negotiations, through: :courses

  # Validations
  validates :name, :abreviation, presence: true
  validates_uniqueness_of :abreviation, scope: [:client_id, :city_id]# valida se existe a mesma abreviação para a mesma cidade e cliente - Cenário que permite ter a mesma instituição com 2 campus na mesma cidade, desde que tenha siglas diferentes.
  validates :image, content_type: { in: [:png, :jpg, :jpeg], message: I18n.t('app.general.flash.invalid_image_format') }
  validates :image, size: { less_than: 750.kilobyte , message: I18n.t('app.general.flash.invalid_image_size') }
  
  # Scope
  include App::Scopes
  scope :by_negotiation, ->(negotiation_ids) { joins(courses: :negotiations).where(negotiations: {id: negotiation_ids}) }
  scope :by_city, ->(city_id) { where(city_id: city_id) }
  scope :search, -> (search) { where("LOWER(UNACCENT(abreviation)) LIKE LOWER(UNACCENT(:search))", search: "%#{search}%") }



  # Methods
  def has_dependency?
    self.courses.any?
  end

  def abreviation_and_city
    "#{abreviation} - #{city.name}"
  end

end
