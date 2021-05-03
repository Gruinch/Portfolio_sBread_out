Rails.application.routes.draw do
  get 'relashionships/create'
  get 'relashionships/index'
  get 'relashionships/destroy'
  get 'interests/create'
  get 'interests/destroy'
  get 'likes/create'
  get 'likes/destroy'
  get 'comments/create'
  get 'comments/edit'
  get 'comments/update'
  get 'comments/destroy'
  get 'articles/new'
  get 'articles/create'
  get 'articles/index'
  get 'articles/show'
  get 'articles/edit'
  get 'articles/update'
  get 'articles/destroy'
  devise_for :users
  resources :users, except: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
