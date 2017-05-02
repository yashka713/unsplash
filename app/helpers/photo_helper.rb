require 'json'

module PhotoHelper

  def from_json_to_hash(json_obj)
    arr = Array.new
    data = JSON.parse(json_obj)['results']
    data.map do |key|
      arr << key['urls']['thumb']
    end
    arr
  end

end
