Rails.application.routes.draw do
  devise_for :users

  get '/search', to: 'search#search'

  root to: "home#index"
end
