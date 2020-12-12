Rails.application.routes.draw do
  devise_for :users

  root to: 'groups#index'

  resources :users, only: [:show] do
    resources :groups
  end

  resources :groups do
    resources :activities
  end
end
