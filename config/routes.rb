Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: "pages#home"

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # Host and Flatmate routes
  resources :hosts, only: [:new, :create] do
    resources :likes, only: [:create, :destroy], module: :hosts
    resources :dislikes, only: [:create, :destroy], module: :hosts
  end

  resources :flatmates, only: [:new, :create] do
    resources :likes, only: [:create, :destroy], module: :flatmates
    resources :dislikes, only: [:create, :destroy], module: :flatmates
  end

  # User role selection
  get "choose_role", to: 'users#choose_role'

  # Steps for flatmates and hosts
  get 'flatmates/:id/step2', to: 'flatmates#edit2', as: :edit2
  patch 'flatmates/:id/step2', to: 'flatmates#update2'

  get 'hosts/:id/step3', to: 'hosts#edit3', as: :edit3
  patch 'hosts/:id/step3', to: 'hosts#update3'

  # Living preferences
  resources :living_preferences, only: [:new, :create, :edit, :update]

  # Matches index
  resources :matches, only: [:index]
end
