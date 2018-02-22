Rails.application.routes.draw do
  get 'home/show'

  resources :shows

  root to: "home#show"
end
