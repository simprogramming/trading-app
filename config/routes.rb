Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#dashboard'

  resources :users, only: [ :show, :edit, :update]

  resources :stocks, only: [ :new, :create, :destroy]

  resources :hot_stocks, only: [ :create, :destroy ]

  resources :positions, only: [ :create, :update]

  resources :groups, only: [ :update]

  get '/dashboard', to: 'pages#dashboard'

  get '/my_watchlist', to: 'pages#my_watchlist' #create & delete

  get '/scoreboard', to: 'pages#scoreboard'

  get '/positions/reset', to: 'positions#reset', as: :reset

  get '/positions/refresh', to: 'positions#refresh', as: :refresh

  get '/positions/no_wallet', to: 'positions#no_wallet', as: :no_wallet


  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :derivatives, only: [ :index, :edit, :update ]
    end
  end

  Rails.application.routes.draw do
  get 'stocks/new'
  # Sidekiq Web UI, only for admins.
    require "sidekiq/web"
    authenticate :user, lambda { |u| u.admin } do
      mount Sidekiq::Web => '/sidekiq'
    end
  end
end
