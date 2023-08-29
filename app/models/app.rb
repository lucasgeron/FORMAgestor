module App
  # lead models/concerns/scopes.rb to all :app models
  require_relative 'concerns/scopes'

  def self.table_name_prefix
    "app_"
  end

end
