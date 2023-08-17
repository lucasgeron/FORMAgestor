class App::RoleVendor < ApplicationRecord
  belongs_to :client, class_name: 'App::Client'
  has_many :vendors, class_name: 'App::Vendor', foreign_key: 'role_id'


   # Scope
   include App::Scopes
   scope :search, -> (search) { where("LOWER(UNACCENT(name)) LIKE LOWER(UNACCENT(:search))", search: "%#{search}%") }
   scope :by_role_vendor_status, -> (status) do 
     case status
       when 'active'
         where(active: true)
       when 'not_active'
         where(active: false)
     end
   end
 
 
   #  Methods
   def has_dependency?
     self.vendors.any?
   end

end
