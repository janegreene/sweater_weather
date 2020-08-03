class BackgroundService
  def get_url(params)
    @place = params[:location]
    response = conn.get("/search/photos")
    results = JSON.parse(response.body, symbolize_names: true)
    Background.new(results)
  end

  private
  def   conn
    Faraday.new(url: "https://api.unsplash.com") do |faraday|
      faraday.params["client_id"] = ENV['unsplash_key'],
      faraday.params["query"] = @place,
      faraday.params["page"] = '1'
    end
  end
end
