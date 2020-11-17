Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :users
  # plus la peine d'avoir le controller user si pas de nesting (car déjà devise)

  resources :psychics, only: [:index, :show, :create, :new] do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:show, :edit, :update]
end
