module ApplicationHelper
  
  def full_title(page_title = '', base_title = t('views.application.title'))
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def has_session?
    user_signed_in? || admin_signed_in?
  end

  def is_link_active?(link)
    controller_name == link ? '-active' : ''
  end

  def get_client_id
    if user_signed_in?
      current_user.client_id
    elsif admin_signed_in?
      current_admin.client_id
    end
  end

  def get_current_access
    if user_signed_in?
      current_user
    elsif admin_signed_in?
      current_admin
    end
  end

  def current_access_has_vendor?
    return false if admin_signed_in?
    current_user.vendor_id.present? ? true : false
  end
  
  def get_logout_path
    if user_signed_in?
      destroy_user_session_path
    elsif admin_signed_in?
      destroy_admin_session_path
    end
  end

  def has_ctas?
    content_for(:ctas_primary) || content_for(:ctas_secondary)
  end

end
