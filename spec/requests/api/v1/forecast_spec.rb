require 'rails_helper'

describe "Forecast API" do
  it "send a forecast" do
    get api_v1_forecast_index_path(params: { location: "denver, co" })

    expect(response).to be_successful
    expect(response.status).to eq(200)

    forecast = JSON.parse(response.body, symbolize_names: true)
    expect(forecast).to be_a(Hash)
  end
end
