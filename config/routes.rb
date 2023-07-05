Rails.application.routes.draw do
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/about', to: 'about#about'
  root 'home#index'
  get '/menu', to: 'books#menu'

  get '/genres', to: 'genres#index'
  resources :books, only: [:index, :show]

  resources :stores, only: [:show]
  get '/search', to: 'books#search', as: 'search_books'



end
