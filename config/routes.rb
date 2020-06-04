Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get '/my_watchlist', to: 'pages#my_watchlist' #create & delete
  resources :hot_stocks, only: [ :create, :destroy ]

  # get '/profile', to: 'pages#profile'
  resources :users, only: [ :show]

  get '/scoreboard', to: 'pages#scoreboard'

  get '/dashboard', to: 'pages#dashboard'



 

  get '/documents/documents', to: 'documents#documents'

  get '/documents/books', to: 'documents#books'


  get '/documents/administratives', to: 'documents#administratives'

  get '/documents/educations', to: 'documents#educations'

  get '/documents/tools', to: 'documents#tools'

  get '/documents/portfolios', to: 'documents#portfolios'

  get '/positions/reset', to: 'positions#reset', as: :reset


  Rails.application.routes.draw do
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
