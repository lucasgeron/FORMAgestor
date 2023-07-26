class App::City < ApplicationRecord
  belongs_to :client, class_name: 'App::Client'


    # Scopes
    include App::Scopes

end
