Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: "pages#home"

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # Host and Flatmate routes
  resources :hosts, only: [:new, :create, :update, :index, :show] do
    resources :likes, only: [:create, :destroy], module: :hosts
    resources :dislikes, only: [:create, :destroy], module: :hosts
  end

  resources :flatmates, only: [:new, :create, :update, :index, :show] do
    resources :likes, only: [:create, :destroy], module: :flatmates
    resources :dislikes, only: [:create, :destroy], module: :flatmates
  end


  # User role selection
  get "choose_role", to: 'users#choose_role'
  patch "role", to: 'users#role'

  get 'flatmates/:id/step2', to: 'flatmates#edit2', as: :flatmate_edit2
  get 'flatmates/:id/step3', to: 'flatmates#edit3', as: :flatmate_edit3

  get 'hosts/:id/step2', to: 'hosts#edit2', as: :host_edit2
  get 'hosts/:id/step3', to: 'hosts#edit3', as: :host_edit3

  get 'tutorial', to: 'pages#tutorial', as: :tutorial
  get 'welcome/:id', to: 'pages#welcome', as: :welcome
  get 'success', to: 'pages#success', as: :success

  # Living preferences
  resources :living_preferences, only: [:new, :create, :edit, :update]

  # Matches index
  resources :matches, only: [:index]
end
