Rails.application.routes.draw do
  resources :bookings, only: [:new, :create, :show]
  # get 'flights/index'

  resources :flights, only: :index do
    get '/page/:page', action: :index, on: :collection
  end

  get '/flights', to: 'flights#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "flights#index"
end
