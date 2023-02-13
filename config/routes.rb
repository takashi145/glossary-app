Rails.application.routes.draw do
  # get 'user/show'
  get 'home/index'
  devise_for :users

  resources :users, only: [:show]

  resources :categories

  # get '/terms/new', to: 'terms#new'
  # post 'terms', to: 'terms#create'

  resources :terms

  root to: "home#index"
end