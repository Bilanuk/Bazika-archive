Rails.application.routes.draw do
  devise_for :users

  get '/search', to: 'search#search'
  get '/show/:id', to: 'search#show', as: 'show'

  root to: "home#index"
end
