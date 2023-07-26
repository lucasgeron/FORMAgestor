module App::ClientsHelper
  
  def sum_all_liceses
    App::Client.only_active.map(&:licenses).sum
  end
  
end
