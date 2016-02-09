require 'rails_helper'

describe "Request API" do

  it 'creates a user with valid JSON attributes' do
		params = {"user": {"email":"scott@scottbot.me","password":"12345678","password_confirmation":"12345678"}}
    post '/users', params.to_json, { "Accept" => "application/json", "Content-Type" => "application/json" }
    json = JSON.parse(response.body)
    expect(json['email']).to eq('scott@scottbot.me')
  end

  it 'returns error with invalid invalid password params' do
		params = {"user": {"email":"scott@scottbot.me","password":"1234","password_confirmation":"1234"}}
    post '/users', params.to_json, { "Accept" => "application/json", "Content-Type" => "application/json" }
    json = JSON.parse(response.body)
    expect(json["error"]).to eq(["Password is too short (minimum is 8 characters)"])
  end

end
