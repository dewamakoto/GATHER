Rails.application.routes.draw do

  devise_for :admins
  namespace :admin do
    resources :contacts, only: [:create, :index, :show]
    resources :comunities, only: [:show, :index, :destroy]
    resources :comments, only: [:destroy]
    resources :posts, only: [:destroy]
    resources :bars, only: [:edit, :update, :destroy, :index, :show]
    resources :users, only: [:edit, :update, :index, :destroy]
  end

  devise_for :users
    get 'bars/search' => 'bars#search', as: 'search'
    resources :bars, only: [:index, :create, :new, :show]
    get 'users/:id/exit' => 'users#exit', as: 'exit'
    root to: 'top#index'
    resources :posts, only: [:destroy, :index, :update]
    get 'posts/:id/new' => 'posts#new', as: 'new_post'
    post 'posts/:id' => 'posts#create', as: 'create_post'
    resources :commnets, only: [:create, :destroy]
    resources :comunities, only: [:create, :update, :destroy, :new, :show, :index]
    resources :favorites, only: [:index, :create, :destroy]
    resources :contacts, only: [:create, :new]
    resources :notifications, only: [:index]
    resources :relationships, only: [:index, :create, :destroy]
    resources :users, only: [:edit, :update, :show]



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
