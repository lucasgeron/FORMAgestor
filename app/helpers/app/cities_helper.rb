module App::CitiesHelper

  def get_state_name(key)
    ConectaAddressBr::States.all.each do |item|
        if item[1] == key
            return item[0]
        end
    end
    return
  end



end
