Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  root to: "users#new"
  get "/signin", to: "sessions#new"
  post "/login", to: "sessions#create"
end
