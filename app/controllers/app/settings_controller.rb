class App::SettingsController < ApplicationController

  before_action :authenticate_user_or_admin!
  

  def index
  end

end