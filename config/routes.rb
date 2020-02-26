Rails.application.routes.draw do
  root to: 'first_view#index'
  resources :first_view, only: [:index]
  resources :trainer, only: [:index]
end
