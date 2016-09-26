Rails.application.routes.draw do
  devise_for :users
  root "static_pages#home"
  mount Ckeditor::Engine => "/ckeditor"

  resources :posts, only: :show

  namespace :admin do
    root "posts#index"
    resources :categories
    resources :users, only: [:index, :update]
    resources :posts
  end
end
