class Api::V1::TrailsController < ApplicationController
  def index
    location = params[:location]

       conn = Faraday.new(url: "https://www.hikingproject.com") do |faraday|
         faraday.params["key"] = ENV['hiking_key']
         faraday.params["lat"] = 40.0274
         faraday.params["lon"] = -105.2519
         faraday.params["limit"] = 10
       end

    response = conn.get("/data/get-trails")
       require "pry"; binding.pry
  end
end
