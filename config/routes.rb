Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :stores do
    resources :meals
  end

  # Defines the root path route ("/")
  root "home#index"
end
