Rails.application.routes.draw do
  get 'users/new'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'home/show'

  resources :sessions, only: [:create, :destroy]
  resources :shows
  resources :users
  resources :trackers

  root to: "home#show"
end
