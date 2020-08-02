class Api::V1::ForecastController < ApplicationController
  def index
    lat_long_json = MapquestService.new.get_lat_long(params["location"])
    lat = lat_long_json[:results][0][:locations][0][:latLng][:lat]
    long = lat_long_json[:results][0][:locations][0][:latLng][:lng]

    city = lat_long_json[:results][0][:locations][0][:adminArea5]
    state = lat_long_json[:results][0][:locations][0][:adminArea3]
    country = lat_long_json[:results][0][:locations][0][:adminArea1]
    # location = city + ", " + state
    # require "pry"; binding.pry

    weather = WeatherService.new
    forecast_json = weather.fetch_weather(lat, long)
    forecast = Forecast.new(forecast_json)
    render json: ForecastSerializer.new(forecast)
    # call maquest from here to get latLng
    #pass lat long to forecast service to call api but do it all here first to get it working
    #the object of this method is to return a forecast when it is called
  end
end
