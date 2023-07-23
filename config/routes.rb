Rails.application.routes.draw do

  get 'books/index'
  get 'books/show'
  get 'books/edit'
  devise_for :users

  get 'homes/about', as: 'about'
  root to: 'homes#top'

  resources :users, only: [:index, :show, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
