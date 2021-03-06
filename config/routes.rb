Rails.application.routes.draw do
  root 'homes#top'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  resources :users, except: [:new, :create, :destroy] do
    collection do
      get '/confirm_unsubscribe' => 'users#unsubscribe', as: '/confirm_unsubscribe'
      patch '/withdraw' => 'users#withdraw', as: '/withdraw'
      get :interests
    end
     member do
      get :following, :followers, :timeline
    end

  end

  resources :relationships, only: [:create, :index, :destroy]

  resources :articles do
    resources :comments, only: [:create, :destroy]
    resources :interests, only: [:create, :destroy]
    resource :visits, only: [:create, :destroy]
    collection do
      get :search_result
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
