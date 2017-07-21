Rails.application.routes.draw do

  scope :api do
    resources :users
    resources :comments
    resources :features
    resources :products
  end
end
