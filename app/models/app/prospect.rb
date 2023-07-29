class App::Prospect < ApplicationRecord
  belongs_to :client, class_name: 'App::Client'
  belongs_to :vendor, class_name: 'App::Vendor', optional: true
  
  # Scopes
  include App::Scopes

  # Methods
  def description 
    return "#{self.institution}, #{self.course}" 
  end

  
  
end
