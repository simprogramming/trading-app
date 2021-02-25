Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#dashboard'

  resources :users, only: [ :show, :edit, :update]

  resources :stocks, only: [ :index, :new, :edit, :update, :create, :destroy] do
    collection { post :import }
  end

  resources :hot_stocks, only: [ :create, :destroy, :index ]

  resources :positions, only: [ :create, :new, :update, :edit, :destroy]

  resources :groups, only: [ :update]

  get '/dashboard', to: 'pages#dashboard'

  get '/admin', to: 'pages#admin'

  get '/my_watchlist', to: 'pages#my_watchlist'

  get '/scoreboard', to: 'pages#scoreboard'

  get '/positions/reset', to: 'positions#reset', as: :reset

  get '/positions/:id/stop_hit', to: 'positions#stop_hit', as: :stop_hit

  get '/positions/refresh', to: 'positions#refresh', as: :refresh

  get '/positions/refresh_my_pl', to: 'positions#refresh_my_pl', as: :refresh_my_pl

  get '/positions/no_wallet', to: 'positions#no_wallet', as: :no_wallet

  get '/positions/perform_now', to: 'positions#perform_now', as: :perform_now

  get '/positions/my_perform_now', to: 'positions#my_perform_now', as: :my_perform_now

  Rails.application.routes.draw do
  get 'stocks/new'
  # Sidekiq Web UI, only for admins.
    require "sidekiq/web"
    authenticate :user, lambda { |u| u.admin } do
      mount Sidekiq::Web => '/sidekiq'
    end
  end
end
