Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :stores do
    member do
      put :sort  #stores/sort
    end
  end

  resources :groups do
    member do
      # post :join
      post :quit
      get :manager
      patch :transfer  #groups/1234567/manager
    end
    resource :invite_link, only: [ :show ]
  end
  
  resources :invites, param: :invite_token, only: [ :new ] do
    resources :memberships, only: [ :new, :create ]
  end
  
  resources :events do
  end
  
  resources :trays do
  end
  #trays/1234567/create

  # Defines the root path route ("/")
  root "home#index"
end

