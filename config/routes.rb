Rails.application.routes.draw do
  get 'stocks/new'
  devise_for :users
  root to: 'pages#dashboard'

  get '/my_watchlist', to: 'pages#my_watchlist' #create & delete
  resources :hot_stocks, only: [ :create, :destroy ]

  # get '/profile', to: 'pages#profile'
  resources :users, only: [ :show]

  resources :groups, only: [ :update]

  get '/scoreboard', to: 'pages#scoreboard'

  get '/dashboard', to: 'pages#dashboard'





  get '/documents/documents', to: 'documents#documents'

  get '/documents/articles', to: 'documents#articles'


  get '/documents/administratives', to: 'documents#administratives'

  get '/documents/educations', to: 'documents#educations'

  get '/documents/tools', to: 'documents#tools'

  get '/documents/portfolios', to: 'documents#portfolios'

  get '/positions/reset', to: 'positions#reset', as: :reset

  get '/positions/no_wallet', to: 'positions#no_wallet', as: :no_wallet


  Rails.application.routes.draw do
  get 'stocks/new'
  # Sidekiq Web UI, only for admins.
    require "sidekiq/web"
    authenticate :user, lambda { |u| u.admin } do
      mount Sidekiq::Web => '/sidekiq'
    end
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :watched_stocks, only: [ :create, :destroy ]

  resources :positions, only: [ :create, :update]


  resources :documents, only: [ :index, :create, :destroy, :new ]

  resources :posts, only: [ :create ] do
    resources :comments, only: [ :create ]
  end
end
