Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :attractions, only: [:new, :create, :index, :show, :edit, :update]
  resources :rides, only: :create

  root to: "users#new"

  get "/signin", to: "sessions#new"
  post "/login", to: "sessions#create"
  post "/logout", to: "sessions#destroy"
end
