class Api::V1::MunchiesController < ApplicationController
  def index
    # params {"end"=>"pueblo, co", "food"=>"chinese", "start"=>"denver, co"
  conn = Faraday.new(url: "https://api.yelp.com") do |faraday|
    faraday.authorization :Bearer, ENV["YELP_KEY"]
    faraday.headers["Authorization"]
  end

  response = conn.get("/v3/businesses/search") do |faraday|
    faraday.params["term"] = params[:food]
    faraday.params["location"] = params[:end]
  end
    require "pry"; binding.pry
  end
end
