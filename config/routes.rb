Rails.application.routes.draw do
  resources :categories do
    resources :deals
  end
  devise_for :customers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/categories', to: 'categories#index', as: 'customer'
  get '/', to: 'splash#index'

  # Defines the root path route ("/")
  root 'categories#index'
end
