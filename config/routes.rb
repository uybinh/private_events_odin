Rails.application.routes.draw do
  root "users#show"
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  get "/signout", to: "sessions#destroy"
  get "/signup", to: "users#new"
  resources "users"
end
