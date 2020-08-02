require 'rails_helper'

describe "WeatherService" do
  it "#fetch_weather" do
    # WebMock.allow_net_connect!
    VCR.use_cassette('weather_for_denver_co') do
      latitude = 39.738453
      longitude = -104.984853
      service = WeatherService.new
      response = service.fetch_weather(latitude, longitude)

      expect(response).to be_a(Hash)
      expect(response[:current]).to be_a(Hash)
      expect(response[:daily]).to be_a(Array)
      expect(response[:daily].length).to eq(8)
      expect(response[:hourly].length).to eq(48)
    end
  end
end
