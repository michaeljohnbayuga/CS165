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
  post 'shows/watch/', to: 'shows#watch'
  post 'shows/unwatch/', to: 'shows#unwatch'
  root to: "home#show"
end
