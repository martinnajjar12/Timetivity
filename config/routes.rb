Rails.application.routes.draw do
  devise_for :users

  root to: 'users#show'

  resources :users, only: [:show] do
    resources :groups, except: [:edit, :update, :destroy]
    resources :activities, except: [:edit, :show, :update, :destroy]
  end
end
