Rails.application.routes.draw do
  root 'home#index'

  # ユーザー関連
  resources :users, only: [:new, :create, :show, :edit, :update]

  # タイプ診断機能
  resources :type_diagnostics, only: [:index, :new, :create, :show]

  # ログイン関連
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  get "/guest_login", to: "sessions#guest_login"

  # 新規登録リンク
  get "/signup", to: "users#new"

  # 日本酒・レビュー関連
  resources :sakes do
    resources :reviews, only: [:create, :index, :edit, :update, :destroy]
  end
end
