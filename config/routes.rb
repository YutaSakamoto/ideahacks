Rails.application.routes.draw do
  get 'categories/business'
  get 'categories/life'
  get 'categories/planning'
  get 'categories/technology'
  get 'categories/art'
  get 'categories/event'
  get 'categories/hobby'

  get 'favorites/index'
  post '/favorites', to: 'favorites#create'

  get 'search', to: 'topics#search'

  root 'topics#index'

  resources :topics do
   resources :reviews
  end
  resources :collections do
   resources :declears
  end
  resources :conversations, only: [:index, :create]  do
    resources :messages, only: [:index, :create]
  end

  devise_for :users,
  path: '',
  path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'},
  controllers: {omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}

  get 'users/id', to: 'users#show'
  resources :users, only: [:show] do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]

  get '/payment_method' => "users#payment"
  get '/payout_method' => "users#payout"
  post '/add_card' => "users#add_card"


  get '/notification_settings' => 'settings#edit'
  post '/notification_settings' => 'settings#update'

  get '/notifications' => 'notifications#index'

  mount ActionCable.server => '/cable'
end
