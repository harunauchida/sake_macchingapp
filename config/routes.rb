Rails.application.routes.draw do
  # トップページ
  root 'home#index'

  # ユーザー関連
  resources :users, only: [:new, :create, :show, :edit, :update] do
    # マイページ用レビュー操作
    resources :reviews, only: [:index, :edit, :update, :destroy], controller: 'user_reviews'
  end

  # サインアップ
  get "/signup", to: "users#new", as: "signup"

  # タイプ診断機能
  resources :type_diagnostics, only: [:index, :new, :create, :show]

  # ログイン関連
  get    "/login",       to: "sessions#new"
  post   "/login",       to: "sessions#create"
  delete "/logout",      to: "sessions#destroy", as: "logout"
  get    "/guest_login", to: "sessions#guest_login"

  # 日本酒・レビュー関連
  resources :sakes do
    resources :reviews, only: [:create, :index, :edit, :update, :destroy]
  end
end
