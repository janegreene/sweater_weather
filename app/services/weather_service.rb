class WeatherService

  def fetch_weather(latitude, longitude)
    response = conn.get("/data/2.5/onecall") do |faraday|
      faraday.params['lat'] = latitude
      faraday.params['lon'] = longitude
      faraday.params["units"] = "imperial"
      faraday.params["exclude"] = "minutely"
    end

    JSON.parse(response.body, symbolize_names: true)
  end
  def destination_weather(location)
    response = conn.get("/data/2.5/weather") do |faraday|
      faraday.params['q'] = location
      faraday.params["units"] = "imperial"
      faraday.params["exclude"] = "minutely"
    end

    json = JSON.parse(response.body, symbolize_names: true)
    json[:weather][0][:description]
  end

private

  def conn
    Faraday.new(url: "http://api.openweathermap.org") do |faraday|
      faraday.params["appid"] = ENV['open_weather_api_key']
    end
  end
end
