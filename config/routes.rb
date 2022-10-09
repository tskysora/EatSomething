Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :stores, except: [:show] do
    member do
      put :sort  #stores/sort
    end
  end

  resources :groups , param: :invite_token do
  # resources :groups do
    member do
      post :join
      post :quit
    end
    resources :memberships, only: [ :new, :create ]
    resource :invite_link, only: [ :show ]
  end

  # Defines the root path route ("/")
  root "home#index"
end

