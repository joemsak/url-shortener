Rails.application.routes.draw do
  resources :urls, only: [:new, :create]
  root to: 'urls#new'
end
