module App::ClientsHelper

  def count_userd_licenses
    App::Client.only_active.map(&:licenses).sum - App::User.only_active.count
  end

  def count_active_licenses
    App::Client.only_active.map(&:licenses).sum
  end

  def count_liceses
    App::Client.all.map(&:licenses).sum
  end


end
