class Api::V1::SessionsController < ApplicationController
  def create
    # require "pry"; binding.pry
    user = User.find_by(email: session_params[:email])
    if user.present? && user.authenticate(session_params[:password])
     render json: UserSerializer.new(user)
    else
      render json: {error: "Please try again",
                    status: 400
                    }, status: 400
    end
  end
  private
  def session_params
    params.permit(:email, :password)
  end
end
