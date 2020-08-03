class Api::V1::TrailsController < ApplicationController
  def index
    location = params[:location]

    conn = Faraday.new(url: "https://www.hikingproject.com") do |faraday|
      faraday.params["key"] = ENV['hiking_key']
      faraday.params["lat"] = '39.738453',
      faraday.params["lon"] = '-104.984853'
    end

    response = conn.get("/data/get-trails") #do |faraday|
    #   faraday.params["lat"] = 39.738453,
    #   faraday.params["lon"] = -104.984853
    # end
    require "pry"; binding.pry
    # expect(lat_lon_info[:results][0][:locations][0][:latLng][:lat]).to eq(39.738453)
    # expect(lat_lon_info[:results][0][:locations][0][:latLng][:lng]).to eq(-104.984853)
    # forecast = ForecastFacade.new.get_weather(params["location"])
    # if forecast.nil?
    #  render json: {error: "Invalid request or no results found."}, status: 400
    # else
    #  render json: ForecastSerializer.new(forecast)
    # end
  end
end
