Rails.application.routes.draw do

  resources :products
  resources :users
  resources :reviews

  root   'static_pages#home'
  get    '/help',    to: 'static_pages#help'
  get    '/about',   to: 'static_pages#about'
  get    '/contact', to: 'static_pages#contact'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

   get    '/product',  to: 'products#show'

  # get     '/product', to: 'products#index'
  # get     '/register',  to: 'products#new'

end
