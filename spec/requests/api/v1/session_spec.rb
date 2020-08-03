require 'rails_helper'

describe 'as a user' do
  before(:each) do
    @params = {
      email: "example@example.com",
      password: "password",
    }
    @user = User.create(email: @params[:email], password: @params[:password])
  end

  it 'returns api key and creates session with correct password' do
    post "/api/v1/sessions?email=#{@params[:email]}&password=#{@params[:password]}"

    expect(response).to be_successful
    expect(response.status).to eq(200)

    request_response = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]
    expect(request_response).to have_key(:api_key)
    expect(request_response[:api_key]).to eq(@user.api_key)
  end

  it 'does not accept bad password' do
    post "/api/v1/sessions?email=#{@params[:email]}&password=wrongpassword"

    expect(response.status).to eq(400)
    error = JSON.parse(response.body, symbolize_names: true)[:error]
    expect(error).to eq("Please try again")
  end
end
