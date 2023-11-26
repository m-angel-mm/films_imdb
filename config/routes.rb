# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  get 'movie/new', to: 'movie#new'
  post 'movie/new', to: 'movie#create'
  get 'movie/edit/:id', to: 'movie#edit'
  patch 'movie/edit/:id', to: 'movie#update'
  get 'movie/show/:id', to: 'movie#show'
  get 'movie/delete/:id', to: 'movie#delete'
  delete 'movie/delete/:id', to: 'movie#destroy'
  get 'movie/search', to: 'movie#search'
  get 'movie/index', to: 'movie#index'

  get 'movie/unauthorized', to: 'movie#unauthorized'

  namespace :api do
    namespace :v1 do
      get 'search', to: 'search_movies#search_movie'
      get 'search_by_imdb_id', to: 'search_movies#search_movie_by_imdb_id'
    end
  end

  get 'movie/login', to: 'authentication#login'
  post 'auth/login', to: 'authentication#authenticate'
  resource :users, path_names: { new: 'signup' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'authentication#login'
  mount Sidekiq::Web => '/sidekiq'
end
