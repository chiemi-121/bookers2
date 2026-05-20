Rails.application.routes.draw do
  # ホーム関連のルート（ログイン前トップとアバウトページ）
  root to: "homes#top"
  get "home/about", to: "homes#about", as: "about"

  resource :session

  resources :users, only: [:index, :show, :edit, :update, :new, :create]
  resources :books, only: [:index, :show, :edit, :update, :create, :destroy]
end