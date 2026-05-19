Rails.application.routes.draw do
  # ホーム関連のルート（ログイン前トップとアバウトページ）
  root to: "homes#top"
  get "home/about", to: "homes#about", as: "about"

  # 認証関連（Rails 8標準のセッション管理。現状のログイン・ログアウトを生かします）
  resource :session

  # 👤 ユーザー機能関連のルーティング（resourcesを使用）
  resources :users, only: [:index, :show, :edit, :update]

  # 📖 投稿機能関連のルーティング（resourcesを使用）
  resources :books, only: [:index, :show, :edit, :update, :create, :destroy]
end