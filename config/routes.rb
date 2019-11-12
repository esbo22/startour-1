Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  resources :ships, only: [:new, :create, :index, :show] do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index]

  namespace :owner do
    resources :ships, only: [:index]
    resources :bookings, only: [:index] do
      member do
        patch "accept"
        patch "decline"
      end
    end
  end

end

