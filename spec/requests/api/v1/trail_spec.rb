require 'rails_helper'

describe "Trail API" do
  it "sends trail info" do
    # VCR.use_cassette('forecast_denver_co') do
      get api_v1_trails_path(params: { location: "denver, co" })

      expect(response).to be_successful
      expect(response.status).to eq(200)

      forecast = JSON.parse(response.body, symbolize_names: true)
      expect(forecast).to be_a(Hash)
    end
  end


# https://www.hikingproject.com/data/get-trails?lat=40.0274&lon=-105.2519&maxDistance=10&key
