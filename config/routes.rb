Rails.application.routes.draw do
  
  resources :users
  resource :session, only: [:create, :new, :destroy]
  resources :friendships, only: [:create, :destroy]
  resources :images, only: [:create, :destroy, :update]
  
  resources :static_pages, only: [:index]
  
  root 'static_pages#index'
  
end
