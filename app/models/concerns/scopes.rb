module App
  module Scopes
    extend ActiveSupport::Concern

    included do
      scope :by_client, ->(client_id) { where(client_id: client_id) }
      scope :by_id, ->(ids) { where(id: ids)}
    end
  
  end
end
