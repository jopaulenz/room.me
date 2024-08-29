Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :hosts, only: [:new, :create]
  resources :flatmates, only: [:new, :create]
  get 'flatmates/:id/step2', to: 'flatmates#edit2', as: :edit2
  patch 'flatmates/:id/step2', to: 'flatmates#update2'
  resources :living_preferences, only: [:new, :create, :edit, :update]

end
