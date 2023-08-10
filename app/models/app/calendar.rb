class App::Calendar < ApplicationRecord
  belongs_to :client, class_name: 'App::Client'

   # Scopes
   include App::Scopes
   scope :by_calendar_status, -> (status) do 
      case status
        when 'active'
          where(active: true)
        when 'not_active'
          where(active: false)
      end
    end

    scope :search, -> (search) {
      search_as_integer = search.to_i
      where("year = :search OR CAST(year AS TEXT) LIKE :search_string", search: search_as_integer, search_string: "%#{search}%")
    }

  #  Methods
  def name 
    "#{year} / #{semester}"
  end

  def has_dependency?
    false
  end

end
