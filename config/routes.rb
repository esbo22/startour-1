Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  resources :ships do
    resources :bookings, only: [:create]
end
resources :bookings, only: [:index, :show, :destroy, :update] do
  resources :ships, only: [:create, :index, :show]
 end

namespace :owner do
  resources :ships, only: [:index]
  resources :bookings, only: [:index, :update]
 end

end

