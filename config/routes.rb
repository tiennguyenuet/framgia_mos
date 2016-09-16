Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    resources :posts, only: :index
  end
  root "static_pages#home"
end
