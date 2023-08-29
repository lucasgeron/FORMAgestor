module App::ProspectsHelper

  def can_set_vendor?(prospect)
    (get_current_access.instance_of?(App::User) && get_current_access.vendor && prospect.vendor.nil?) ? true : false
  end

  def has_notification?
    App::Prospect.by_client(get_client_id).where(vendor_id: nil).count > 0 ? true : false
  end

  def get_prospect_status
    [ t('activerecord.options.app/prospect.status.all'), t('activerecord.options.app/prospect.status.prospected'), t('activerecord.options.app/prospect.status.not_prospected')]
  end



end
