Rails.application.routes.draw do
  devise_for :users
  
  devise_scope :user do
    get '/users/sign_up' => 'devise/registrations#new', as: 'new_user'
    get '/users/sign_in' => 'devise/sessions#new', as: 'new_session'
    get '/session/new' => 'devise/sessions#new'
    post '/session/new' => 'devise/sessions#create'

  end

  root to: "homes#top"
  get "home/about" => "homes#about", as: "about"
  
  resources :books, only: [:index, :show, :edit, :create, :update, :destroy] do
    resource :favorites, only: [:create, :destroy], as: :favorite
    resources :book_comments, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update, :index]do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end




end