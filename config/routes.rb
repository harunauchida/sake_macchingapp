Rails.application.routes.draw do
  root "sakes#index"

  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :sakes, only: [:index, :show]
  resources :reviews, only: [:create, :destroy]
  resources :type_diagnostics, only: [:index, :create, :show]

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get "/guest_login", to: "sessions#guest_login"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
