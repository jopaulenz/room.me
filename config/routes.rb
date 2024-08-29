Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :hosts, only: [:new, :create, :update]
  resources :flatmates, only: [:new, :create, :update]

  get "choose_role", to: 'users#choose_role'

  get 'flatmates/:id/step2', to: 'flatmates#edit2', as: :flatmate_edit2
  get 'flatmates/:id/step3', to: 'flatmates#edit3', as: :flatmate_edit3

  get 'hosts/:id/step3', to: 'hosts#edit2', as: :host_edit2
  get 'tutorial', to: 'pages#tutorial', as: :tutorial


  resources :living_preferences, only: [:new, :create, :edit, :update]



end
