class Api::V1::BackgroundController < ApplicationController
  def index
    place = params[:location]

    conn = Faraday.new(url: "https://api.unsplash.com") do |faraday|
      faraday.params["client_id"] = ENV['unsplash_key'],
      faraday.params["query"] = place,
      faraday.params["page"] = '1'
    end

    response = conn.get("/search/photos")

    results = JSON.parse(response.body, symbolize_names: true)
    background_url = Background.new(results)
    # background_url = results[:results][0][:urls][:raw]
    render json: BackgroundSerializer.new(background_url)
  end
end
