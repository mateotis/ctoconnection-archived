Rails.application.routes.draw do
  root 'home#show'
  get 'dashboard', to: 'dashboard#show'
  get 'auth/auth0/callback', to: 'auth0#callback'
  get 'auth/failure', to: 'auth0#failure'
  get 'logout', to: 'logout#logout'
  get 'about', to: 'pages#about'

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
