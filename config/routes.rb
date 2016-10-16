Rails.application.routes.draw do
  devise_for :users
  resources :galleries, only: [:new, :create, :index]
  root 'galleries#index'
  resources :users, only: [:show, :edit, :update]
end
