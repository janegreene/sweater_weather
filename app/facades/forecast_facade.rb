class ForecastFacade
  def get_weather(location)
   return nil if location.nil? || location == ""
   lat_long_json = MapquestService.new.get_lat_long(location)
   lat = lat_long_json[:results][0][:locations][0][:latLng][:lat]
   long = lat_long_json[:results][0][:locations][0][:latLng][:lng]
   location = Location.new(lat_long_json)
   weather = WeatherService.new
   forecast_json = weather.fetch_weather(lat, long)
   forecast = Forecast.new(forecast_json, location)
  end
end
