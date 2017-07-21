Rails.application.routes.draw do
  resources :comments
  resources :features
  resources :products
  scope :api do
    resources :users
  end
end
