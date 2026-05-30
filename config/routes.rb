Rails.application.routes.draw do
  devise_for :businesses
  get '/registro', to: 'pages#registro', as: :opciones_registro
  resources :shopping_carts
  resources :items
  resources :businesses
  devise_for :users
  get "pages/home"
  delete '/shopping_carts/:id/empty', to: 'shopping_carts#empty', as: :empty_shopping_cart
  post '/shopping_cart/add_item/:item_id', to: 'shopping_carts#add_item', as: :add_item_to_cart


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "businesses#index"
end
