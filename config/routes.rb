Rails.application.routes.draw do
  devise_for :users
  root "static_pages#home"

  namespace :admin do
    root "posts#index"
    resources :posts, only: :index
    resources :categories
    resources :categories, only: [:index, :new, :create]
    resources :users, only: [:index, :update]
  end
end
