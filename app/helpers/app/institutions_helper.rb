module App::InstitutionsHelper
  
  def set_selected_institution(negotiation, params)
    return negotiation.course.institution_id if negotiation.present?
    return params[:institution_id] if params.present? && params[:institution_id].present?
    return false
  end
  
end
