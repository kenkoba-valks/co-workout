Rails.application.routes.draw do
  devise_for :coaches, controllers: {
  sessions:      'coaches/sessions',
  passwords:     'coaches/passwords',
  registrations: 'coaches/registrations'
}
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  root "first_view#index"
  resources :first_view, only: [:index]
  resources :location, only: [:index]
  resources :users, only: [:index,:edit,:update]
  resources :coaches, only: [:index] do
    resources :messages, only: [:index, :create]
  end
end
