Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :hosts, only: [:new, :create]
  resources :flatmates, only: [:new, :create]

  get "choose_role", to: 'users#choose_role'
  patch "role", to: 'users#role'

  get 'flatmates/:id/step2', to: 'flatmates#edit2', as: :edit2
  patch 'flatmates/:id/step2', to: 'flatmates#update2'

  get 'hosts/:id/step3', to: 'hostss#edit2', as: :edit3
  patch 'hosts/:id/step3', to: 'hosts#update2'


  resources :living_preferences, only: [:new, :create, :edit, :update]



end
