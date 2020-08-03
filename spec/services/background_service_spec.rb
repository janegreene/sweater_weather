require 'rails_helper'

describe "BackgroundService" do
  it "#get_url" do
    VCR.use_cassette('background_url_denver_co') do
      params = "denver, co"
      response = BackgroundService.new.get_url(params)
      expect(response[:results].first).to have_key(:urls)
      expect(response).to be_a(Hash)
    end
  end
end
