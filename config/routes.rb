Rails.application.routes.draw do
  devise_for :users

  get '/search', to: 'search#search'
  get '/show/:id', to: 'search#show', as: 'show'
  post '/add_to_favourites', to: 'titles#create_favourite', as: 'add_to_favourites'
  post '/add_status', to: 'titles#set_status'

  get '/favourites', to: 'profile#favourites', as: 'favourites'
  get '/planning', to: 'profile#planning', as: 'planning'
  get '/watching', to: 'profile#watching', as: 'watching'
  get '/watched', to: 'profile#watched', as: 'watched'

  get '/users', to: 'user_profile#users', as: 'index_users'
  get '/user/:id', to: 'user_profile#user', as: 'show_user'
  get '/user/:id/favourites', to: 'user_profile#favourites', as: 'user_favourites'
  get '/user/:id/watching', to: 'user_profile#watching', as: 'user_watching'
  get '/user/:id/planning', to: 'user_profile#planning', as: 'user_planning'
  get '/user/:id/watched', to: 'user_profile#watched', as: 'user_watched'

  

  root to: "home#index"
end
