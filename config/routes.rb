Rails.application.routes.draw do
  devise_for :users
  root to: 'pcs#index'
  resources :pcs
  resources :users
end
