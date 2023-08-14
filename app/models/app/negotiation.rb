class App::Negotiation < ApplicationRecord
  include ActionView::Helpers::TextHelper

  belongs_to :calendar, class_name: 'App::Calendar'
  belongs_to :course, class_name: 'App::Course'
  belongs_to :vendor, class_name: 'App::Vendor', optional: true
  belongs_to :company, class_name: 'App::Company', optional: true
  belongs_to :status, class_name: 'App::StatusNegotiation', optional: true


  before_validation :calculate_period

  # Scope
  include App::Scopes
  scope :by_vendor, ->(vendor_id) { where(vendor_id: vendor_id) }
  scope :by_status_negotiation, ->(status_id) { where(status_id: status_id) }
  scope :by_institution, ->(institution_ids) { joins(:course).merge(App::Course.by_institution(institution_ids)) }
  scope :search, -> (search) { where("LOWER(UNACCENT(reference)) LIKE LOWER(UNACCENT(:search))", search: "%#{search}%") }
  scope :by_calendar, ->(calendar_id) { where(calendar_id: calendar_id)}  

  # Methods
  def calculate_period
    self.period =  (((self.calendar.year - Time.now.year) * 2) - ((Time.now.month > 6 ? 2 : 1) - self.calendar.semester) - self.course.duration)* -1
  end

  def period_in_words
    period_in_words = ''
    case 
      when self.period > self.course.duration then 
        period_in_words = "Encerrado há #{pluralize((self.period - self.course.duration), 'Semestre', 'Semestres')}"
      when self.period <= 0 then
        period_in_words = "Abre em #{pluralize(((self.period * -1) + 1), 'Semestre', 'Semestres')}"
      else
        period_in_words = "#{self.period}º Período"
    end

    "#{period_in_words}"

  end

  def name
    "#{self.course.name}"
  end

  def period_in_words_and_calendar
    "#{self.period_in_words} - #{self.calendar.name}"
  end

end
