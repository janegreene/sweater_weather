class BackgroundService
  def get_url(params)
    @params = params
    response = conn.get("/search/photos")
    results = JSON.parse(response.body, symbolize_names: true)
  end

  private
  def   conn
    Faraday.new(url: "https://api.unsplash.com") do |faraday|
      faraday.params["client_id"] = ENV['unsplash_key'],
      faraday.params["query"] = @params,
      faraday.params["page"] = '1'
    end
  end
end
