Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "users/callbacks"}
  root "static_pages#home"
  mount Ckeditor::Engine => "/ckeditor"

  resources :posts, only: :show

  namespace :admin do
    root "statistics#index"
    delete "destroy_multi_post", to: "posts#destroy"
    delete "destroy_multi_category", to: "categories#destroy"
    delete "destroy_multi_advertisment", to: "advertisments#destroy"
    delete "destroy_multi_confession", to: "confessions#destroy"
    resources :statistics, only: :index
    resources :categories
    resources :users, only: [:index, :update]
    resources :posts
    resources :advertisments
    resources :confessions
    devise_for :users, controllers: {
      sessions: "admin/sessions"
    }
  end
end
