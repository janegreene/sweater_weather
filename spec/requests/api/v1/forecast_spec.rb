require 'rails_helper'

describe "Forecast API" do
  it "send a forecast" do
    VCR.use_cassette('forecast_denver_co') do
      get api_v1_forecast_index_path(params: { location: "denver, co" })

      expect(response).to be_successful
      expect(response.status).to eq(200)

      forecast = JSON.parse(response.body, symbolize_names: true)
      expect(forecast).to be_a(Hash)
    end
  end
    it 'returns error with invalid or empty request' do
      get '/api/v1/forecast?location='

      expect(response).to have_http_status(400)

      forecast = JSON.parse(response.body)
      expect(forecast["error"]).not_to be_empty
      expect(forecast["error"]).to eq("Invalid request or no results found.")
    end
end
