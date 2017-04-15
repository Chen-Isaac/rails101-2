Rails.application.routes.draw do
  devise_for :users
  resources :groups do
    member do
      post :join_try
      post :quit_try
    end
    resources :posts
  end
  root 'groups#index'
end
