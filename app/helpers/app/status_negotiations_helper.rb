module App::StatusNegotiationsHelper
  def get_bg_color_for(status)
    return "bg-gray-600" unless status.color.present?
    "bg-#{status.color}-600"
  end

  def get_text_color_for(status)
    return "text-#{status.color}-600" if status.color == 'default'
    "text-#{status.color}-600"
  end
end
