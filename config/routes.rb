Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'
  get 'books/edit'
  get 'books/index'
  get 'books/show'
  get 'homes/about'
  get 'users/show'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy]   
end
