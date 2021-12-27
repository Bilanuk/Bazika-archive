Rails.application.routes.draw do
  devise_for :users

  get '/search', to: 'search#search'
  get '/show/:id', to: 'search#show', as: 'show'
  post '/add_to_favourites', to: 'titles#create', as: 'add_to_favourites'

  get '/profile', to: 'user_profile#index'
  get '/users', to: 'user_profile#users', as: 'index_users'
  

  root to: "home#index"
end
