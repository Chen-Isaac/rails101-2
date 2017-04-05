Rails.application.routes.draw do
  resources :groups
  root 'welcome#index_try'
end
