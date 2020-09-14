Rails.application.routes.draw do
  resources :users
  devise_for :users
  root 'home#index'
end
