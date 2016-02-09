require 'rails_helper'

describe User do
  before { @user = FactoryGirl.build(:user) }

  subject { @user }

  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  it { should be_valid }

	it 'requires min password length of 8' do
		should validate_length_of(:password).is_at_least(8)
	end

	it 'does not allow password length shorter than 8' do
		user = User.create(email: "test@test.com", password: "1234", password_confirmation: "1234")
		expect(user.errors.full_messages).to eq(["Password is too short (minimum is 8 characters)"])
	end

end
