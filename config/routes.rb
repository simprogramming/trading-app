Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :watchlist_stocks do
    resources :stocks, only: [ :create, :new, :show, :delete]
  end

  resources :positions

  resources :documents
end
