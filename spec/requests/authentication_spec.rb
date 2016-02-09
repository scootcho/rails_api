require 'rails_helper'

describe "Request API" do
  it 'creates a user' do
		params = {"user": {"email":"scott@scottbot.me","password":"12345678","password_confirmation":"12345678"}}

    post '/users', params.to_json, { "Accept" => "application/json", "Content-Type" => "application/json" }

		json = JSON.parse(response.body)

    # test for the 200 status-code
    expect(response).to be_success

    # check to make sure the right amount of messages are returned
    expect(json['email']).to eq('scott@scottbot.me')
  end
end
