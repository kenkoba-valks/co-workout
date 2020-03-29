Rails.application.routes.draw do
  devise_for :coaches, controllers: {
  sessions:      'coaches/sessions',
  passwords:     'coaches/passwords',
  registrations: 'coaches/registrations'
}
  
  devise_scope :coach do
    get 'coach_addresses', to: 'coaches/registrations#new_address'
    post 'coach_addresses', to: 'coaches/registrations#create_address'
  end

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get 'user_addresses', to: 'users/registrations#new_address'
    post 'user_addresses', to: 'users/registrations#create_address'
  end

  root "first_view#index"
  resources :first_view, only: [:index]
  resources :location, only: [:index]
  resources :users, only: [:index,:edit,:update] 
  resources :coaches, only: [:index] do
    collection do
      get 'search'
    end
    resources :messages, only: [:index, :create]
  end
end
