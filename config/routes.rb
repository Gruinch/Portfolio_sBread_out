Rails.application.routes.draw do
  root 'homes#top'
  get '/about' => 'homes#about'
  devise_for :users
  resources :users, except: [:new, :create, :destroy]
  resources :articles
  resources :comments, except: [:show]
  resources :likes, only: [:create, :destroy]
  resources :interests, only: [:create, :index, :destroy]
  resources :relationships, only: [:create, :index, :destroy]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
