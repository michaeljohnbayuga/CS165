Rails.application.routes.draw do
  get 'sessions/create'

  get 'sessions/destroy'

  get 'home/show'

  resources :sessions, only: [:create, :destroy]
  resources :shows
  resources :users
  resources :trackers
  resources :seasons

  post 'sessions/create', to: 'sessions#create'
  root to: "home#show"
end
