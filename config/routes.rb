Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: "pages#home"

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # Host and Flatmate routes
  resources :hosts, only: [:new, :create, :update, :index, :show] do
    resources :likes, only: [:create, :destroy]
    resources :dislikes, only: [:create, :destroy]
  end

  resources :flatmates, only: [:new, :create, :update, :index, :show] do
    resources :likes, only: [:create, :destroy]
    resources :dislikes, only: [:create, :destroy]
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
  get 'matched', to: 'pages#matched', as: :matched
  # Living preferences
  resources :living_preferences, only: [:new, :create, :edit, :update]

  # Matches index
  resources :matches, only: [:index, :show] do
    resources :messages, only: :create
  end
  get 'chats', to: 'matches#chats'  # List all chats
  get 'chats/:id', to: 'matches#chat', as: :chat  # Show a specific chat

  get 'user_dashboard', to: 'users#dashboard', as: :user_dashboard
  get 'edit_profile', to: 'users#edit_profile', as: :edit_profile
  patch 'update_user_data', to: 'users#update_profile', as: 'update_user_data' # two ideas here
end
