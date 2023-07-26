module App::UpdatesHelper
  def convert_to_hash(string)
    string.split("-").reject(&:empty?).map do |item|
      title, description = item.split(" | ").map(&:strip)
      { title: title, description: description }
    end
  end  
end
