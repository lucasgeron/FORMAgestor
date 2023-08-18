module App::CoursesHelper

  def set_selected_course(negotiation, params)
    return negotiation.course_id if negotiation.present?
    return params[:course_id] if params.present? && params[:course_id].present?
    return false
  end

end
