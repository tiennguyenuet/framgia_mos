Rails.application.routes.draw do
  devise_for :users
  root "static_pages#home"

  namespace :admin do
    resources :posts, only: :index
    resources :categories, only: [:index, :new, :create]
  end
end
