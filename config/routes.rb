Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'dashboard', to: 'pages#dashboard'
  get 'code_of_conduct', to: 'pages#code_of_conduct'
  get 'auth/auth0/callback', to: 'auth0#callback'
  get 'auth/failure', to: 'auth0#failure'
  get 'logout', to: 'auth0#logout'
  get 'apply/new', to: 'applicants#new'
  get 'apply', to: 'applicants#create'
  get 'new_events', to: 'talks#new_events'
  get 'upcoming_events', to: 'talks#upcoming_events'

  resources :applicants
  resources :talks

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

  namespace :useradmin do
    root to: 'users#index'
    resources :users
  end
end
