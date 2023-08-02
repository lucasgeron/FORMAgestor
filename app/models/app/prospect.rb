class App::Prospect < ApplicationRecord
  belongs_to :client, class_name: 'App::Client'
  belongs_to :vendor, class_name: 'App::Vendor', optional: true
  
  # Scopes
  include App::Scopes
  scope :by_prospect_status, -> (status) { where(vendor_id: status) }
  
  scope :search, -> (search) { where("LOWER(UNACCENT(name)) LIKE LOWER(UNACCENT(:search)) OR 
                                      LOWER(UNACCENT(institution)) LIKE LOWER(UNACCENT(:search)) OR 
                                      LOWER(UNACCENT(course)) LIKE LOWER(UNACCENT(:search)) OR 
                                      LOWER(UNACCENT(city)) LIKE LOWER(UNACCENT(:search))", search: "%#{search}%") }



  # Methods
  def description 
    return "#{self.institution}, #{self.course}" 
  end


  # Settings 
  self.per_page = 16  
  
end
