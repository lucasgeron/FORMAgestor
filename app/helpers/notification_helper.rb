module NotificationHelper
  def icon_for(type)
    case type
      when 'success'
        'circle-check'
      when 'error'
        'circle-xmark'
      when 'warning'
        'exclamation-triangle'
      when 'info'
        'circle-info'
      else
        'circle-exclamation'
    end
  end

  def style_icon_for(type)
    case type
      when 'success'
        'text-green-500 bg-green-100 dark:bg-green-800 dark:text-green-200'
      when 'error'
        'text-red-500 bg-red-100 dark:bg-red-800 dark:text-red-200'
      when 'warning'
        'text-amber-500 bg-amber-100 dark:bg-amber-900 dark:text-amber-400'
      when 'info'
        'text-blue-500 bg-blue-100 dark:bg-blue-800 dark:text-blue-200'
      else
        'text-gray-500 bg-gray-200 dark:bg-gray-700 dark:text-gray-200'
    end
  end

  def style_text_for(type)
    case type
      when 'success'
        'text-green-500 dark:text-green-200'
      when 'error'
        'text-red-500 dark:text-red-200'
      when 'warning'
        'text-amber-500 dark:text-amber-200'
      when 'info'
        'text-blue-500 dark:text-blue-200'
      else
        'text-gray-500 dark:text-gray-200'
    end
  end

end
