Rails.application.routes.draw do
  Rails.application.routes.draw do
    devise_for :users, controllers: {
      registrations: 'registrations'
    }
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users
  resources :posts do
    resources :likes
    resources :comments
  end
  resources :follows do
    member do
      patch :approve
      patch :decline
    end
  end
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "posts#index"
end
