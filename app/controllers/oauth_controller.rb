
class OauthController < ApplicationController
  skip_before_action :authenticate_user!

  def github
    # requested token
    token = HTTParty.post("https://github.com/login/oauth/access_token", {
      query: {
        client_id: ENV["GITHUB_CLIENT_ID"],
        client_secret: ENV["GITHUB_CLIENT_SECRET"],
        code: params[:code]
      },
      headers: { "Accept" => "application/json"}
      }).parsed_response

      # store the token in profile
    profile = HTTParty.get("https://api.github.com/user", {
      query: token,
      headers: { "User-Agent" => "HTTParty", "Accept" => "application/json" }
      }).parsed_response

      # check if the user already exists
    user = User.where("github_id = :github_id OR email = :email", github_id: profile["id"], email: profile["email"]).first

    # otherwise create a new user with github user name
    user = User.new(username: profile["login"], email: profile["email"]) unless user
    # add a github id to the user regardless whether it's an exsiting user or a new one.
    user[:github_id] = profile["id"]

    # save the user and if there're any error let us know
    if user.save
      token = Auth.issue({ id: user.id})
      render json: { user: UserSerializer.new(user), token: token}
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end

  end


  def facebook
    # requested token
    token = HTTParty.post("https://graph.facebook.com/v2.9/oauth/access_token", {
      query: {
        client_id: ENV["FACEBOOK_APP_ID"],
        client_secret: ENV["FACEBOOK_APP_SECRET"],
        redirect_uri: 'http://localhost:7000/',
        code: params[:code]
      },
      headers: { "Accept" => "application/json"}
      }).parsed_response

      p token

      # store the token in profile
    profile = HTTParty.get("https://graph.facebook.com/v2.5/me?fields=id,name,first_name,last_name,email,picture.height(300)", {
      query: token,
      headers: { "User-Agent" => "HTTParty", "Accept" => "application/json" }
      }).parsed_response

      # check if the user already exists
    user = User.where("facebook_id = :facebook_id OR email = :email", facebook_id: profile["id"], email: profile["email"]).first

    # otherwise create a new user with github user name
    user = User.new(username: profile["login"], email: profile["email"]) unless user
    # add a facebook_id id to the user regardless whether it's an exsiting user or a new one.
    user[:facebook_id] = profile["id"]

    # save the user and if there're any error let us know
    if user.save
      token = Auth.issue({ id: user.id})
      render json: { user: UserSerializer.new(user), token: token}
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end

  end

  def instagram
    # requested token
    token = HTTParty.post("https://api.instagram.com/oauth/access_token", {
      body: {
        client_id: ENV["INSTAGRAM_CLIENT_ID"],
        client_secret: ENV["INSTAGRAM_SECRET_KEY"],
        redirect_uri: 'http://localhost:7000',
        grant_type: 'authorization_code',
        code: params[:code]
      },
      headers: { "Accept" => "application/json"}
      }).parsed_response

      p token

      # store the token in profile
      profile = token["user"]

      p profile

      # check if the user already exists
    user = User.where("instagram_id = :instagram_id OR email = :email", instagram_id: profile["id"], email: profile["email"]).first

    # otherwise create a new user with instagram user name
    user = User.new(username: profile["login"], email: profile["email"]) unless user
    # add a instagram id to the user regardless whether it's an exsiting user or a new one.
    user[:instagram_id] = profile["id"]

    # save the user and if there're any error let us know
    if user.save
      token = Auth.issue({ id: user.id})
      render json: { user: UserSerializer.new(user), token: token}
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end

  end

end
