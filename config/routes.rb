Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/dashboard', to: 'users#show'
  post '/users', to: 'users#create'

  get '/discover', to: 'movies#index'
  get '/movies', to: 'movies#search'
  get '/movies/:id', to: 'movies#show'

  post '/movies/:movie_id/parties', to: 'parties#create'
  get '/movies/:movie_id/parties/new', to: 'parties#new'

  # resources :movies do
  #   resources :parties, only: [:create]
  # end
  resources :parties
end
