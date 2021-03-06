Rails.application.routes.draw do
  resources :products do
    collection do
      get :models_of_manufacturer
      get :data_memories_of_model
    end
  end
  resources :data_memories
  resources :manufacturers
  devise_for :users
  root 'products#index'
  resources :users, except: :show
  resources :models
end
