Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  devise_scope :user do
    get 'log-in', to: 'sessions#create'
    get 'log-out', to: 'sessions#destroy', as: :destroy_user_session
  end
  resources :vehicles
  resources :vehicle_types, path: 'vehicle-types'
  resources :pages
  resources :home_page
  resources :users
  get 'our-vehicles', to: 'vehicle_page#show'
  get ':id', to: 'pages#show'
  root to: "home_page#show"
end
