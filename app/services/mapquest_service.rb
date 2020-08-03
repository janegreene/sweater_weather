class MapquestService
  def get_lat_long(params)
    response = Faraday.get('https://www.mapquestapi.com/geocoding/v1/address') do |faraday|
        faraday.params['key'] = ENV['mapquest_api_key']
        faraday.params['location'] = params
        faraday.params['outFormat'] = 'json'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_distance(params)
    response = Faraday.get('https://www.mapquestapi.com/directions/v2/route') do |faraday|
        faraday.params['key'] = ENV['mapquest_api_key']
        faraday.params['from'] = 'denver, co' #need better way
        faraday.params['to'] = params
        faraday.params['outFormat'] = 'json'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

end
