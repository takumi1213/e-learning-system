Rails.application.routes.draw do
  
  get 'sessions/new'
  get 'static_pages/home'
  get 'static_pages/about'
  get 'static_pages/contact'

  root  'static_pages#home'
  resources :users
  get '/signup', to: 'users#new' 

  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  resources :sessions, only: :create
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
