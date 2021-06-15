class Api::V1::UsersController < ApplicationController
  wrap_parameters User

  def create
    user = User.new(user_params)
    user.api_key = SecureRandom.base64(24)
    if user.save
      render json: UsersSerializer.new(user), status: 201
    else
      render json: {errors: ["user DID NOT save!, check your request"]}, status: 400
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
