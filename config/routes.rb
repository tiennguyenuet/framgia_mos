Rails.application.routes.draw do
  namespace :admin do
    root "posts#index"
    resources :posts, only: :index
  end
end
