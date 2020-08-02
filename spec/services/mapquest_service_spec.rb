require 'rails_helper'

describe "MapquestService" do
  it "#get_lat_long" do
    # WebMock.allow_net_connect!
    VCR.use_cassette('location_denver_co') do
    lat_lon_info = MapquestService.new.get_lat_long("Denver, CO")
    expect(lat_lon_info[:results][0][:locations][0][:latLng][:lat]).to eq(39.738453)
    expect(lat_lon_info[:results][0][:locations][0][:latLng][:lng]).to eq(-104.984853)
  end
  end
end
# You can stub this request with the following snippet:
#
# stub_request(:get, "https://www.mapquestapi.com/geocoding/v1/address?key=wPx7dptHKtYaGHnqkL62XUlHIHHd1k
# ob&location=Denver,%20CO&outFormat=json").
#   with(
#     headers: {
#    'Accept'=>'*/*',
#    'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
#    'User-Agent'=>'Faraday v1.0.1'
#
#     }).
#   to_return(status: 200, body: "", headers: {})
