class UsersController < ApplicationController
  skip_before_action :authenticate_request!, only: [:create] #only action that can be perform by unauthenticated user

  def index
    render json: { message: "you're on the welcome page!" }
  end

  def create
    user = User.new(user_params)

    if user.save
      render json: { id: user.id, email: user.email }, status: 201
    else
      render json: { error: user.errors.full_messages }, status: 422
    end
  end

  def update
		user = User.find(params[:id])

		if user.update(user_params)
			render json: { id: user.id, email: user.email }, status: 200
		else
			render json: { errors: user.errors }, status: 422
		end
	end
  
  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
