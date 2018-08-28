Rails.application.routes.draw do
  get 'categories/business'
  get 'categories/life'
  get 'categories/planning'
  get 'categories/technology'
  get 'categories/art'
  get 'categories/event'
  get 'categories/hobby'
  root 'topics#index'
  resources :topics do
  resources :reviews
end

  devise_for :users,
            path: '',
            path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'},
            controllers: {registrations: 'registrations'}

resources :users, only: [:show]
end
