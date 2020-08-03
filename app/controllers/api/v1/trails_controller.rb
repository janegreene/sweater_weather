class Api::V1::TrailsController < ApplicationController
  def index
    location = params[:location]
    # https://www.hikingproject.com/data/get-trails?lat=40.0274&lon=-105.2519&maxDistance=10&key=200861553-a2819058290113b9e790a69f1418a568
    # conn = Faraday.get( "https://www.hikingproject.com/data/get-trails") do |faraday|
    #   faraday.params["key"] = ENV['hiking_key']
    #   faraday.params['maxDistance'] = '10'
    #   faraday.params['lat'] = '39.7384',
    #   faraday.params['lon'] = '-104.9848'
    # end

    # response = conn.get("/data/get-trails") do |faraday|
    # faraday.params['lat'] = '39.738453',
    # faraday.params['lon'] = '-104.984853'
    # #   faraday.params["lat"] = 39.738453,
    # #   faraday.params["lon"] = -104.984853
    # end
    # require "pry"; binding.pry
    # expect(lat_lon_info[:results][0][:locations][0][:latLng][:lat]).to eq(39.738453)
    # expect(lat_lon_info[:results][0][:locations][0][:latLng][:lng]).to eq(-104.984853)
    # forecast = ForecastFacade.new.get_weather(params["location"])
    # if forecast.nil?
    #  render json: {error: "Invalid request or no results found."}, status: 400
    # else
    #  render json: ForecastSerializer.new(forecast)
    # end


    # api.openweathermap.org/data/2.5/weather?q=Boston&appid=f2d541bf2b6a86e4eaf296f28b3e1cab
       # destination = DestinationFacade.new
       # @weather_at = destination.destination_weather(@destination.name)
       # conn = Faraday.new( "https://www.hikingproject.com/") do |faraday|
       #   faraday.params["key"] = ENV['hiking_key'],
       #   faraday.params['limit'] = 10
       # end
       # #
       # response = conn.get("/data/get-trails") do |faraday|
       #   faraday.params['lat'] = '39.7384',
       #   faraday.params['lon'] = '-104.9848'
       # end
       # json = JSON.parse(response.body, symbolize_names: true)
       # @weather = Weather.new(json)
       require "pry"; binding.pry
  end
end
