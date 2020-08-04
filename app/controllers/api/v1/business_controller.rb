class Api::V1::BusinessController < ApplicationController
  def index
    conn = Faraday.new(url: "https://api.yelp.com") do |faraday|
      faraday.authorization :Bearer, ENV["YELP_KEY"]
      faraday.headers["Authorization"]
    end

    response = conn.get("/v3/businesses/search") do |faraday|
      faraday.params["term"] = params[:term]
      faraday.params["location"] = params[:location]
    end
    require "pry"; binding.pry
  end
end
