class Location
  attr_reader :city, :state, :country
  def initialize(lat_long_json)
    @city = lat_long_json[:results][0][:locations][0][:adminArea5]
    @state = lat_long_json[:results][0][:locations][0][:adminArea3]
    @country = lat_long_json[:results][0][:locations][0][:adminArea1]
  end
end
