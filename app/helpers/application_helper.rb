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



end
