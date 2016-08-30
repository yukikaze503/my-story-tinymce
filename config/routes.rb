Rails.application.routes.draw do
  resources :stories
  resources :users
  resources :sessions

  get '/signup', to: 'users#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'session#destroy'

  root 'stories#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
