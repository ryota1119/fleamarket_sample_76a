Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root 'items#index'
  resources :items, only: [:new, :create, :show] do
    resources :images, only: :create
  end
  resources  :users, only: [:show, :destroy] do
    member do
      get :logout
      get :credit
    end
  end
end
