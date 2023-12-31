class App::Prospect < ApplicationRecord
  belongs_to :client, class_name: 'App::Client'
  belongs_to :vendor, class_name: 'App::Vendor', optional: true
  
  # Validations
  validates :name, :phone, :city, :institution, :course, :amount, :year_graduation, presence: true
  

  # Scopes
  include App::Scopes
  scope :by_prospect_status, -> (status) do 
      case status
      when 'prospected'
        where.not(vendor_id: nil)
      when 'not_prospected'
        where(vendor_id: nil)
      end
  end

  scope :by_vendor, -> (vendor_ids) { where(vendor: vendor_ids) }
  scope :search, -> (search) { where("LOWER(UNACCENT(name)) LIKE LOWER(UNACCENT(:search)) OR 
                                      LOWER(UNACCENT(institution)) LIKE LOWER(UNACCENT(:search)) OR 
                                      LOWER(UNACCENT(course)) LIKE LOWER(UNACCENT(:search)) OR 
                                      LOWER(UNACCENT(city)) LIKE LOWER(UNACCENT(:search))", search: "%#{search}%") }

  
end
