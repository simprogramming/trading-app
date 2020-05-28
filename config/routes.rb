Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get '/my_watchlist', to: 'pages#my_watchlist' #create & delete
  resources :hot_stocks, only: [ :create, :destroy ]

  get '/profile', to: 'pages#profile'

  get '/scoreboard', to: 'pages#scoreboard'

  get '/dashboard', to: 'pages#dashboard'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :watched_stocks, only: [ :create, :destroy ]

  resources :positions, only: [ :create, :update]


  resources :documents, only: [ :index, :create, :destroy, :new ]

  resources :posts, only: [ :create ] do
    resources :comments, only: [ :create ]
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :restaurants, only: [ :index ]
    end
  end
end
