class Api::V1::SessionsController < ApplicationController
  wrap_parameters User
  before_action :set_user

  def create
    if @user.try(:authenticate, user_params[:password])
      render json: UsersSerializer.new(@user), status: 200
    else
      render json: {errors: ["incorrect password"]}, status: 404
    end
  end

  private

  def set_user
    @user = User.find_by(email: user_params[:email])
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
