class Api::V1::BackgroundController < ApplicationController
  def index
    place = params[:location]
    background_url = UnsplashResults.new.get_url(place)


    if background_url.nil?
      render json: {error: "Invalid request or no results found."}, status: 400
    else
      render json: BackgroundSerializer.new(background_url)
    end
  end
end
