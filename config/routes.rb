Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :stores, except: [:show]

  # Defines the root path route ("/")
  root "home#index"
end
