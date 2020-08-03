class TrailFacade
  def get_trails(params)

    location = params[:location]
    lat_long_json = MapquestService.new.get_lat_long(location)
    lat = lat_long_json[:results][0][:locations][0][:latLng][:lat]
    long = lat_long_json[:results][0][:locations][0][:latLng][:lng]


       conn = Faraday.new(url: "https://www.hikingproject.com") do |faraday|
         faraday.params["key"] = ENV['hiking_key']
         faraday.params["lat"] = lat
         faraday.params["lon"] = long
         faraday.params["limit"] = 10
       end

    response = conn.get("/data/get-trails")
    trails = JSON.parse(response.body, symbolize_names: true)
    forecast = ForecastFacade.new.get_weather(location)
    Trail.format_trails(trails)
    trail_objs = Trail.all_instances

    #########
   # return nil if location.nil? || location == ""
   # lat_long_json = MapquestService.new.get_lat_long(location)
   # lat = lat_long_json[:results][0][:locations][0][:latLng][:lat]
   # long = lat_long_json[:results][0][:locations][0][:latLng][:lng]
   # location = Location.new(lat_long_json)
   # weather = WeatherService.new
   # forecast_json = weather.fetch_weather(lat, long)
   # forecast = Forecast.new(forecast_json, location)
  end
end
