Rails.application.routes.draw do
  namespace :admin do
    root to: 'events#index'
    resources :companies
    resources :events
    resources :users
    resources :activities
    resources :sessions
    resources :presentations
  end
end
