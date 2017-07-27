Rails.application.routes.draw do


  scope :api do
    post 'tone', to: 'tone_analyzer#tone'
    post 'register', to: 'authentications#register'
    post 'login', to: 'authentications#login'
    post 'oauth/github', to: 'oauth#github'
    post 'oauth/facebook', to: 'oauth#facebook'
    post 'oauth/instagram', to: 'oauth#instagram'
    resources :users
    resources :comments

    resources :products do
      put :upvote, on: :member
      put :downvote, on: :member
    end

    resources :features do
      put :upvote, on: :member
      put :downvote, on: :member
    end

  end
end
