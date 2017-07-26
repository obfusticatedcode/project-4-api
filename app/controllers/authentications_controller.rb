class AuthenticationsController < ApplicationController

  skip_before_action :authenticate_user!

  def register
    user = User.new(user_params)
    if user.save
      render json: user, status: :ok
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def login
    return render json: { credentials: ["Invalid credentials"] }, status: 401 unless params[:email] && params[:password]
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      token = Auth.issue({ id: user.id })
      render json: { token: token, user: UserSerializer.new(user) }, status: :ok
    else
      render json: { credentials: ["Invalid credentials"] }, status: 401
    end
  end

  private
  def user_params
    params.permit(:username, :email, :firstname, :lastname, :image, :password, :password_confirmation)
  end
end
