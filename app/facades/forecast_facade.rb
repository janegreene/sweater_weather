class ForecastFacade
  def get_weather(location)
   #  json_weather = OpenWeatherService.new.fetch_weather(location)
   # weather_to_return = Weather.new(json_weather)
   # picture_to_return = GiphyService.new.fetch_picture(weather_to_return.summary)
   # weather_to_return.gif = picture_to_return
   # weather_to_return


   lat_long_json = MapquestService.new.get_lat_long(location)
   lat = lat_long_json[:results][0][:locations][0][:latLng][:lat]
   long = lat_long_json[:results][0][:locations][0][:latLng][:lng]

   # city = lat_long_json[:results][0][:locations][0][:adminArea5]
   # state = lat_long_json[:results][0][:locations][0][:adminArea3]
   # country = lat_long_json[:results][0][:locations][0][:adminArea1]
   # location = city + ", " + state
   location = Location.new(lat_long_json)
   weather = WeatherService.new
   forecast_json = weather.fetch_weather(lat, long)

   forecast = Forecast.new(forecast_json, location)
  end
end
