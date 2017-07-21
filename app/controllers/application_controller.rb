class ApplicationController < ActionController::API
  #This is a method that runs before any other controller action
  #using a skip here as all the routes will be protected including the register and login.

  before_action :authenticate_user!

  def authenticate_user!
    render json: { errors: ["Unauthorized"] }, status: 401 unless user_signed_in?
  end

  def user_signed_in?
    !!current_user
  end

  def current_user
   @current_user ||= User.find(decoded_token[:id]) if id_found?
  rescue
   nil
  end

  private

  #checks if we have found a user id inside the decoded token
  def id_found?
  token && decoded_token && decoded_token[:id]
  end

  #decode the token using the Auth class if a token was found
  def decoded_token
      @decoded_token ||= Auth.decode(token) if token
  end

  def token
    @token ||= if request.headers['Authorization'].present?
      request.headers['Authorization'].split.last
    end
  end
end
