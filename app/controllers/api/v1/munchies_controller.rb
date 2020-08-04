class Api::V1::MunchiesController < ApplicationController
  def index
    # params {"end"=>"pueblo, co", "food"=>"chinese", "start"=>"denver, co"
    json_food = YelpService.new.find_restaurant(params)
  # conn = Faraday.new(url: "https://api.yelp.com") do |faraday|
  #   faraday.authorization :Bearer, ENV["YELP_KEY"]
  #   faraday.headers["Authorization"]
  # end
  #
  # response = conn.get("/v3/businesses/search") do |faraday|
  #   faraday.params["term"] = params[:food]
  #   faraday.params["location"] = params[:end]
  # end
  # json_food = JSON.parse(response.body, symbolize_names: true)
    # name = json[:businesses][0][:name]
    # address = json[:businesses][0][:location][:display_address].join(", ")
    # food = Restaurant.new(json)
    # forecast = WeatherService.new.destination_weather(params[:end])
    munchie = Munchie.new(params, json_food)
    test = MunchieSerializer.new(munchie)
    # require "pry"; binding.pry
  end
end
