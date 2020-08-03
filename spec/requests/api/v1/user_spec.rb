require 'rails_helper'

describe "User endpoint" do
  it "creates an account with an API key" do
    data = {
      email: "example@email.com",
      password: "password",
      password_confirmation: "password"
    }
    post "/api/v1/users?email=#{data[:email]}&password=#{data[:password]}&password_confirmation=#{data[:password_confirmation]}"

    expect(response).to be_successful
    expect(response.status).to eq(201)

    user = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]
    expect(user).to have_key(:api_key)
    expect(User.all.count).to eq(1)
  end

end
