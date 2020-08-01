require 'rails_helper'

describe "Forecast API" do
  it "send a forecast" do
    # get '/api/v1/forecasts'
    get api_v1_forecast_index_path(params: { location: "denver, co" })

    expect(response).to be_successful
  end
end
