Rails.application.routes.draw do
  devise_for :users
  root "static_pages#home"

  namespace :admin do
    root "posts#index"
    resources :posts, only: :index
    resources :categories
  end
end
