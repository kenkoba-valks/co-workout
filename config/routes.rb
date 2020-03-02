Rails.application.routes.draw do
  devise_for :users
  root "first_view#index"
  resources :first_view, only: [:index]
  resources :location, only: [:index]
  resources :users, only: [:edit,:update]
  resources :trainer, only: [:index] do
    resources :messages, only: [:index, :create]
  end
end
