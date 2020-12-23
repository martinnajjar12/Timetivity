Rails.application.routes.draw do
  root to: 'users#show'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  post '/facebook-deletion', to: 'users#facebook_deletion'
  resources :users, only: [:show, :destroy] do
    resources :groups, except: [:edit, :update, :destroy]
    resources :activities, except: [:edit, :show, :update, :destroy]
  end
end
