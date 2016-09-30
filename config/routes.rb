Rails.application.routes.draw do
  devise_for :users
  root "static_pages#home"
  mount Ckeditor::Engine => "/ckeditor"

  resources :posts, only: :show

  namespace :admin do
    root "posts#index"
    delete "destroy_multi_post", to: "posts#destroy"
    delete "destroy_multi_category", to: "categories#destroy"
    delete "destroy_multi_advertisment", to: "advertisments#destroy"
    resources :categories
    resources :users, only: [:index, :update]
    resources :posts
    resources :advertisments
  end
end
