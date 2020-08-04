require 'rails_helper'

describe "yelp business API" do
  it "sends business info" do
    # VCR.use_cassette('forecast_denver_co') do
      get api_v1_business_index_path(params: { location: "denver, co", term: 'deli' })

      expect(response).to be_successful
      expect(response.status).to eq(200)

      forecast = JSON.parse(response.body, symbolize_names: true)
      expect(forecast).to be_a(Hash)
    end
  end
