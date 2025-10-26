Rails.application.routes.draw do  
  # トップページ
  root 'home#index'

  # ユーザー関連
  resources :users, only: [:new, :create, :show, :edit, :update] do
    # マイページ用レビュー操作
  resources :reviews, only: [:index, :edit, :update, :destroy], controller: 'user_reviews'

    # お気に入り一覧（マイページ用）
    get 'favorites', to: 'favorites#index', as: 'favorites'
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

  # お問い合わせ
  get  'contact', to: 'contacts#new'
  post 'contact', to: 'contacts#create'
  resources :contacts, only: [:new, :create]


  # 日本酒・レビュー・お気に入り関連
  resources :sakes do
    resources :reviews, only: [:create, :index, :edit, :update, :destroy]
    resource  :favorite, only: [:create, :destroy] 
  end
end
