Rails.application.routes.draw do
  root to: 'users#show'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users, only: [:show] do
    resources :groups, except: [:edit, :update, :destroy]
    resources :activities, except: [:edit, :show, :update, :destroy]
  end
end
