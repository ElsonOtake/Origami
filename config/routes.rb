Rails.application.routes.draw do
  resources :categories, only: %i[index new create] do
    resources :deals, only: %i[index new create]
  end
  devise_for :customers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/categories', to: 'categories#index', as: 'customer'

  # Defines the root path route ("/")
  root 'splash#index'
end
