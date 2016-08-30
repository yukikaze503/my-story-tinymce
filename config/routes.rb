Rails.application.routes.draw do
  resources :stories
  resources :users
  resources :sessions

  get '/signup', to: 'users#new'
  post ''

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
