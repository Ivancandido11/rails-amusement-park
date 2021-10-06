Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :attractions, only: [:index, :show]
  resources :rides, only: :create

  root to: "users#new"

  get "/signin", to: "sessions#new"
  post "/login", to: "sessions#create"
  post "/logout", to: "sessions#destroy"
end
