Rails.application.routes.draw do
  get 'home/show'

  resources :shows
  resources :trackers

  root to: "home#show"
end
