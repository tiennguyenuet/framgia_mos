Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  root "static_pages#home"

  namespace :admin do
    resources :categories
    resources :categories, only: [:index, :new, :create]
    resources :users, only: [:index, :update]
    resources :posts
  end
end
