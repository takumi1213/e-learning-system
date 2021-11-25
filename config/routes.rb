Rails.application.routes.draw do
  
  get 'activities/index'
  get 'answers/new'
  resources :lessons do
    resources :answers
  end
  resources :answers, only: :create

  get 'sessions/new'
  get 'static_pages/home'
  get 'static_pages/about'
  get 'static_pages/contact'

  root  'static_pages#home'
  
  resources :users do
    member do
      get :following, :followers
    end
  end

  get '/signup', to: 'users#new' 

  resources :sessions, only: :create
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'

  resources :categories do
    resources :words
  end

  resources :words, only: [:create,:update] 

  #For follow and unfollow
  resources :relationships, only: [:create, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
