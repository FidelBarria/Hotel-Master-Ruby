Rails.application.routes.draw do
  get "pages/reception"
  devise_for :users, controllers: {
        sessions: "users/sessions"
      }

  namespace :admin do
    resources :users
  end

  root "home#index"

  resources :dashboard, only: [ :index ]
  resources :hotels do
    resources :users, only: [ :new, :create ]
    resources :reservations
    resources :guests
  end
  resources :rooms
  resources :payments
  resources :configurations
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
