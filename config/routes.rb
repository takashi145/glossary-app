Rails.application.routes.draw do
  # get 'user/show'
  get 'home/index'
  devise_for :users

  resources :users, only: [:show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: "home#index"
end
