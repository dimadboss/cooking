Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"

  resources :products, only: [:index]
  resources :measures, only: [:index]
  resources :recipes, only: [:index]
  resources :users, only: [:index]
  resources :product_abouts, only: [:index]
  resources :product_recipes, only: [:index]

  # Routs for recipes
  get '/recipes', to: 'recipes#index'
  get '/recipes/new', to: 'recipes#new'
  get '/recipes/:id/edit', to: 'recipes#edit'
  get '/recipes/:id', to: 'recipes#show'
  post '/recipes/:id', to: 'recipes#update'
  delete '/recipes/:id', to: 'recipes#destroy'

  # Routes for user
  get '/users/new', to: 'users#new'
end
