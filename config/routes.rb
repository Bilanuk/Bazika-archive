Rails.application.routes.draw do
  devise_for :users

  get '/search', to: 'search#search'
  get '/show/:id', to: 'search#show', as: 'show'
  post '/add_to_favourites', to: 'titles#create_favourite', as: 'add_to_favourites'
  post '/add_status', to: 'titles#set_status'

  get '/profile', to: 'user_profile#index'
  get '/users', to: 'user_profile#users', as: 'index_users'
  get '/user/:id', to: 'user_profile#user', as: 'show_user'
  

  root to: "home#index"
end
