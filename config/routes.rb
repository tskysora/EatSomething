Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :stores, except: [:show] do
    member do
      put :sort  #stores/sort
    end
  end

  # Defines the root path route ("/")
  root "home#index"
end
