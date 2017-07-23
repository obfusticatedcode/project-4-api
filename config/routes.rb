Rails.application.routes.draw do

  scope :api do
    post 'register', to: 'authentications#register'
    post 'login', to: 'authentications#login'
    post 'oauth/github', to: 'oauth#github'
    post 'oauth/facebook', to: 'oauth#facebook'
    post 'oauth/instagram', to: 'oauth#instagram'
    resources :users
    resources :comments

    resources :features do
      member do
        put "love" => "features#upvote"
        put "unlove" => "features#downvote"
      end
    end

    resources :products
  end
end
