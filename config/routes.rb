Rails.application.routes.draw do
  get 'visits/create'
  get 'visits/destroy'
  root 'homes#top'
  get '/about' => 'homes#about'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  resources :users, except: [:new, :create, :destroy] do
    collection do
      get '/confirm_unsubscribe' => 'users#unsubscribe', as: '/confirm_unsubscribe'
      patch '/withdraw' => 'users#withdraw', as: '/withdraw'
    end
  end

  resources :articles do
    resources :comments, only: [:create, :destroy]
    resources :interests, only: [:create, :index, :destroy]
    resource :visits, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :index, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
