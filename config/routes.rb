Rails.application.routes.draw do

  devise_for :users

  get 'homes/about', as: 'about'
  root to: 'homes#top'

  resources :users, only: [:index, :show, :edit]
  resources :books, only: [:index, :create, :show, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
