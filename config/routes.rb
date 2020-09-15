Rails.application.routes.draw do
  resources :data_memories
  resources :manufacturers
  devise_for :users
  root 'home#index'
  resources :users
  resources :models
end
