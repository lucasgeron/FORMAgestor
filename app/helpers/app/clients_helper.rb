module App::ClientsHelper
<<<<<<< HEAD
  
  def sum_all_liceses
    App::Client.only_active.map(&:licenses).sum
  end
  
=======

  def count_userd_licenses
    App::Client.only_active.map(&:licenses).sum - App::User.only_active.count
  end

  def count_active_licenses
    App::Client.only_active.map(&:licenses).sum
  end

  def count_liceses
    App::Client.all.map(&:licenses).sum
  end


>>>>>>> a759820c143df7d3a776df8e9a3c7abc5a3072c6
end
