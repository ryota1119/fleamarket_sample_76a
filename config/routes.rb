Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resouces :users, only: :show
end
