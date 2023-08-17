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
  # scope :by_vendor, ->(vendor_id) { where(vendor_id: vendor_id) }

  scope :by_vendor, ->(vendor_id) do

    # return where(vendor_id: vendor_id) 
    if vendor_id.is_a?(App::Vendor)
      where(vendor_id: vendor_id)
    elsif vendor_id.include?('-1') # Se o array de vendor_id incluir uma string vazia
      where(vendor_id: [nil] + vendor_id.reject(&:empty?)) # Inclui nil e os outros ids não vazios
    else
      where(vendor_id: vendor_id.reject(&:empty?))
    end
  end


  scope :by_course, ->(course_id) { where(course_id: course_id) }
  # scope :by_company, ->(company_id) { where(company_id: company_id) }

  # scope :by_status_negotiation, ->(status_ids) { where(status_id: status_ids) }


  scope :by_status_negotiation, ->(status_ids) do
    if status_ids.include?('-1') # Se o array de status_ids incluir uma string vazia
      where(status_id: [nil] + status_ids.reject(&:empty?)) # Inclui nil e os outros ids não vazios
    else
      where(status_id: status_ids.reject(&:empty?))
    end
  end

  scope :by_company, ->(company_ids) do
    if company_ids.include?('-1') # Se o array de company_ids incluir uma string vazia
      where(company_id: [nil] + company_ids.reject(&:empty?)) # Inclui nil e os outros ids não vazios
    else
      where(company_id: company_ids.reject(&:empty?))
    end
  end


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
    "#{self.calendar.name} - #{self.period_in_words}"
  end

end
