module ClientsHelper

  def count_userd_licenses
    Client.only_active.map(&:licenses).sum - User.only_active.count
  end

  def count_active_licenses
    Client.only_active.map(&:licenses).sum
  end

  def count_liceses
    Client.all.map(&:licenses).sum
  end


end
