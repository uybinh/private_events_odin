Rails.application.routes.draw do
  root "events#index"
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  get "/signout", to: "sessions#destroy"
  get "/signup", to: "users#new"
  resources "users"
  resources "events"
end
