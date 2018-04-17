Rails.application.routes.draw do
  get 'home/show'

  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'profile', to: 'users#index', as: 'profile'

  resources :sessions, only: [:create, :destroy]
  resources :users
  resources :shows
  resources :trackers
  resources :seasons
  resources :episodes

  post 'ratings/rate1', to: 'ratings#rate1'
  post 'ratings/rate2', to: 'ratings#rate2'
  post 'ratings/rate3', to: 'ratings#rate3'
  post 'ratings/rate4', to: 'ratings#rate4'
  post 'ratings/rate5', to: 'ratings#rate5'

  post 'sessions/create', to: 'sessions#create'
  post 'seasons/watch/', to: 'seasons#watch'
  post 'seasons/unwatch/', to: 'seasons#unwatch'
  post 'seasons/:id', to: 'seasons#update'
  post 'episodes/:id', to: 'episodes#update'

  root to: "home#show"
end
