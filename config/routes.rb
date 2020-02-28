Rails.application.routes.draw do
  devise_for :users
  root "first_view#index"
  resources :first_view, only: [:index]
  resources :trainer, only: [:index]
  resources :messages, only: [:index]
  resources :location, only: [:index]
  resources :users, only: [:edit,:update]
end
