class App::Interaction < ApplicationRecord
  belongs_to :client, class_name: 'App::Client'
  belongs_to :vendor, class_name: 'App::Vendor'
  belongs_to :negotiation, class_name: 'App::Negotiation'
  belongs_to :status, class_name: 'App::StatusInteraction'

  # Scopes
  include App::Scopes
  scope :search, -> (search) { where("LOWER(UNACCENT(description)) LIKE LOWER(UNACCENT(:search))", search: "%#{search}%") }
  scope :by_vendor, -> (vendor_ids) { where(vendor_id: vendor_ids) }
  scope :by_status_interaction, ->(status_ids) { where(status_id: status_ids) }

  #Methods
  def has_dependency?
    false
  end
  
end
