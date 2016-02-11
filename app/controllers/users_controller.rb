class UsersController < ApplicationController
  skip_before_action :authenticate_request!, only: [:create] #only action that can be perform by unauthenticated user

  def index
    render json: { message: "you're on the welcome page!" }
  end

  def create
    # we're building the user this way to prevent the users from manually manipulating company_id, and ensure all company admin can only create user within its company.
    company = Company.find(@current_user.company_id)
    new_user = company.users.build
    user = new_user.new(user_params)

    if user.save
      # current_order is Order.new hence its a order object with nil id, this means it can't be referenced. need to figure out a way for this
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
