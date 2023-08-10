class App::Company < ApplicationRecord
  belongs_to :client, class_name:'App::Client'
  
  # Scopes
  include App::Scopes
  scope :search, -> (search) { where("LOWER(UNACCENT(name)) LIKE LOWER(UNACCENT(:search))", search: "%#{search}%") }
  scope :by_company_status, -> (status) do 
    case status
      when 'active'
        where(active: true)
      when 'not_active'
        where(active: false)
    end
  end

  # Methods
  def has_dependency?
    false
  end


end
