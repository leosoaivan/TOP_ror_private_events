Rails.application.routes.draw do
  get 'events/new'
  get 'events/:id', to: 'events#show', as: 'event'
  get 'events', to: 'events#index'
  post 'events/create', to: 'events#create'

  root 'sessions#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  
  get 'users', to: 'users#index'
  get 'users/new'
  get 'users/:id', to: 'users#show', as: 'user'
  post 'users/create', to: 'users#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
