Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:new]
  resources  :users, only: [:show, :destroy] do
    member do
      get :logout
      get :credit
    end
  end
end
