Rails.application.routes.draw do
  devise_for :users

  root to: 'groups#index'

  resources :users, only: [:show] do
    resources :groups
    resources :activities
  end
end
