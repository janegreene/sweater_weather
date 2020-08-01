require 'rails_helper'

describe "MapquestService" do
  xit "#get_lat_long" do
    # service =
    lat_lon_info = MapquestService.new.get_lat_long("Denver, CO")
    # expect(lat_lon_info[:status]).to eq("OK")
    # expect(lat_lon_info).to be_an(Array)
    expect(lat_lon_info[:results][0][:locations][0][:latLng][:lat]).to eq(39.738453)
    expect(lat_lon_info[:results][0][:locations][0][:latLng][:lng]).to eq(-104.984853)
  end

end
