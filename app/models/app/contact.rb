class App::Contact < ApplicationRecord
  belongs_to :negotiation, class_name: 'App::Negotiation', optional: true
  belongs_to :client, class_name: 'App::Client'

  # Scopes
  include App::Scopes
  scope :search, -> (search) { where("LOWER(UNACCENT(name)) LIKE LOWER(UNACCENT(:search)) OR 
                                      LOWER(UNACCENT(instagram)) LIKE LOWER(UNACCENT(:search))", search: "%#{search}%") }


  # Methods
  def info
    output = []
    output << "<i class='fa-solid fa-address-book'></i> #{ I18n.t('activerecord.options.app/contact.info.none') }" unless self.informant || self.committee
    output << "<i class='fa-solid fa-graduation-cap'></i> #{ I18n.t('activerecord.options.app/contact.committee.true') }" if self.committee 
    output << "<i class='fa-solid fa-bullhorn'></i> #{ I18n.t('activerecord.options.app/contact.informant.true') }"  if self.informant
    output.join(" | ").html_safe
  end

  def has_dependency?
    false
  end


end
