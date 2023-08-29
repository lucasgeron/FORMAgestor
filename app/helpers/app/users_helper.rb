module App::UsersHelper




  def count_active_users
    App::User.only_active.count
  end
  
end