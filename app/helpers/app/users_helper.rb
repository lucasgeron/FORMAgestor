module App::UsersHelper

  def has_available_license?
    unless get_current_access.client.available_licenses > 0
      flash[:error] =  t('views.app.users.flash.no_license_available', client:get_current_access.client.name)
      redirect_to request.referrer || app_users_path
    end
  end

  def can_save?(active)
    
    unless get_current_access.client.available_licenses > 0 || (get_current_access.client.available_licenses.zero? && active == false)
      flash.now[:error] = t('views.app.users.flash.no_license_available', client:get_current_access.client.name)
      flash.now[:info] = action_name == 'create' ? t('views.app.users.flash.tip_for_create').html_safe : t('views.app.users.flash.tip_for_update').html_safe
      return false
    end
    true
  end            

  def count_active_users
    App::User.only_active.count
  end
  
end