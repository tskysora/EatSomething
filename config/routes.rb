Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :stores, except: [:show] do
    member do
      put :sort  #stores/sort
    end
  end

  resources :groups do
    member do
      # post :join
      post :quit
    end
    resource :invite_link, only: [ :show ]
  end
  
  resources :invites, param: :invite_token, only: [ :new ] do
    resources :memberships, only: [ :new, :create ]
  end
  
  resources :events

  # Defines the root path route ("/")
  root "home#index"
end

