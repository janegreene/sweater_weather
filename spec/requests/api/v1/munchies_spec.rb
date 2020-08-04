require 'rails_helper'

describe "Munchies API endpoint" do
  it "sends weather travel and food info" do
      get api_v1_munchies_path(params: { start: "denver, co", end: "pueblo, co", food: 'chinese' })

      expect(response).to be_successful
      expect(response.status).to eq(200)

      munchie = JSON.parse(response.body, symbolize_names: true)
      expect(munchie).to be_a(Hash)
    end
  end
