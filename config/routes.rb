Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'dashboard', to: 'pages#dashboard'
  get 'auth/auth0/callback', to: 'auth0#callback'
  get 'auth/failure', to: 'auth0#failure'
  get 'logout', to: 'auth0#logout'

  namespace :admin do
    root to: 'events#index'
    resources :companies
    resources :events
    resources :users
    resources :email_addresses
    resources :activities
    resources :sessions
    resources :presentations
  end
end
