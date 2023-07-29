class ApplicationController < ActionController::Base
  
  def authenticate_user_or_admin!
    if current_admin
      authenticate_admin!
    elsif current_user
      authenticate_user!
    else
      redirect_to new_user_session_path
    end
  end

  def after_sign_in_path_for(resource)
    if current_admin
      app_clients_path
    elsif current_user
      app_users_path
    else
      root_path
    end
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  def is_client_scope?(client_id)
    return true if current_admin # grants access to admin
    if client_id.to_i != current_user.client_id
      flash.now[:error] = "You can't modify data from other clients. Don't try this again, or your account will be blocked."
      false
    else
      true
    end
  end

  # check if record belongs to current user's client
  def check_client_id

    # get controller namespace and name # app/users - used for redirect_back if record not found by direct link.
    namespace, controller = controller_path.split("/")
    url = url_for([namespace.to_sym, controller.to_sym])

    should_redirect = false

    record = "App::#{controller_name.classify}".constantize.find_by(id: params[:id])
    if record.nil?
      flash[:error] = t('views.app.general.flash.not_found', model: "App::#{controller_name.classify}".constantize.model_name.human)
      should_redirect = true
    elsif get_client_id != record.client_id

      if current_user 
      flash[:error] = [ t('views.app.general.flash.unauthorized'), t('views.app.general.flash.ban_alert') ]
      else 
        flash[:success] = t('views.app.admins.flash.update_client', client: get_current_access.client.name)
        flash[:info] = t('views.app.general.flash.switch_client')
      end
      should_redirect = true
    end
    
    redirect_to url if should_redirect
    
  end

  # set client_id for model instance
  def set_client_id(model_instance)
    model_instance.client_id = get_client_id
  end
  
  def get_client_id
    current_user ? current_user.client_id : current_admin.client_id
  end

  def get_current_access
    current_user ? current_user : current_admin
  end

  def to_b(value)
    value == '1' ? true : false
  end
  

end
