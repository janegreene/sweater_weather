class YelpService
  def find_restaurant(params)
    response = conn.get("/v3/businesses/search") do |faraday|
      faraday.params["term"] = params[:food]
      faraday.params["location"] = params[:end]
    end
    JSON.parse(response.body, symbolize_names: true)
  end

private
  def conn
    Faraday.new(url: "https://api.yelp.com") do |faraday|
    faraday.authorization :Bearer, ENV["YELP_KEY"]
    faraday.headers["Authorization"]
    end
  end
end
