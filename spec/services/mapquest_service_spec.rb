require 'rails_helper'

describe "MapquestService" do
  it "#get_lat_long" do
    VCR.use_cassette('location_denver_co') do
      lat_lon_info = MapquestService.new.get_lat_long("Denver, CO")
      expect(lat_lon_info[:results][0][:locations][0][:latLng][:lat]).to eq(39.738453)
      expect(lat_lon_info[:results][0][:locations][0][:latLng][:lng]).to eq(-104.984853)
    end
  end
end
