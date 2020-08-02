class Api::V1::ForecastController < ApplicationController
  def index
    # weather_response = WeatherFacade.new.get_weather(params["location"])
    # render json: WeatherSerializer.new(weather_response)
    ##goals##
    forecast = ForecastFacade.new.get_weather(params["location"])

    # lat_long_json = MapquestService.new.get_lat_long(params["location"])
    # lat = lat_long_json[:results][0][:locations][0][:latLng][:lat]
    # long = lat_long_json[:results][0][:locations][0][:latLng][:lng]
    #
    # city = lat_long_json[:results][0][:locations][0][:adminArea5]
    # state = lat_long_json[:results][0][:locations][0][:adminArea3]
    # country = lat_long_json[:results][0][:locations][0][:adminArea1]
    # # location = city + ", " + state
    #
    # weather = WeatherService.new
    # forecast_json = weather.fetch_weather(lat, long)
    # forecast = Forecast.new(forecast_json)
    render json: ForecastSerializer.new(forecast)
    #pass lat long to forecast service to call api but do it all here first to get it working
    #the object of this method is to return a forecast when it is called
  end
end
