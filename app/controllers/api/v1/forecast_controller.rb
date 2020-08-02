class Api::V1::ForecastController < ApplicationController
  def index
    forecast = ForecastFacade.new.get_weather(params["location"])
    if forecast.nil?
     render json: {error: "Invalid request or no results found."}, status: 400
    else
     render json: ForecastSerializer.new(forecast)
    end
  end
end
