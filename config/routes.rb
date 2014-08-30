Rails.application.routes.draw do
  get ':id', to: 'urls#show'
  resources :urls, only: [:new, :create]
  root to: 'urls#new'
end
