Rails.application.routes.draw do
  devise_for :users
  root to: "messages#index"
  namespace :messages do
    resources :searches, only: :index
  end
  resources :messages do
    resources :comments, only: :create
  end
  resources :users, only: :show
end
