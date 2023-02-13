Rails.application.routes.draw do
  # get 'user/show'
  get 'home/index'
  devise_for :users

  resources :users, only: [:show]

  resources :categories

  root to: "home#index"
end
