module App
  module Scopes
    extend ActiveSupport::Concern

    included do
      scope :by_client, ->(client_id) { where(client_id: client_id) }
    end
  end
end
