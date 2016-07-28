Rails.application.routes.draw do
  # get 'sessions/new'

  root 'static_pages#home'



  get'/home', to: 'static_pages#home'
  get'/about', to: 'static_pages#about'
  get'/help', to: 'static_pages#help'

  # dynamic routes
  get '/signup', to: 'users#new'
  # get '/users', to: 'users#index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'

  delete '/logout',  to: 'sessions#destroy'

  resources :users#, only: [ :new ]

  # get 'static_pages/home'
  # get 'static_pages/about'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
