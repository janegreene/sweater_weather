class Api::V1::UsersController < ApplicationController
  def create
    if params[:password] == params[:password_confirmation]
      user = User.create(user_params)
      # require "pry"; binding.pry
      render json: UserSerializer.new(user), status: :created
    # else
      # render :json => { status: 400, :errors => user.errors.full_messages }, status: 400
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
