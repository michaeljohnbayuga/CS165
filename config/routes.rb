Rails.application.routes.draw do
  get 'home/dormer'

  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'profile', to: 'users#index', as: 'profile'

  resources :sessions, only: [:create, :destroy]
  resources :users
  resources :dormers
  resources :studentassistants, only:[:create, :destroy] 
  resources :bedchecks
  resources :violations, only:[:create,:destroy]
  resources :dailyreports
  post 'dormers/regular_search', to: 'dormers#regular_search'
  post 'dormers/filter_search', to: 'dormers#filter_search'
  post 'bedchecks/destroy', to: 'bedchecks#destroy'
  post 'home/filter_search', to: 'home#filter_search'

  root to: "home#dormer"
end
