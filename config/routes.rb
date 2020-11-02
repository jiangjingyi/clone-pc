Rails.application.routes.draw do
  get 'expence/index'
  get 'expence/edit'

  devise_for :users, controllers: {
    registrations:'users/registrations',
    sessions:'users/sessions'
  }
  root to: 'pcs#index'
  resources :pcs
  resources :users
  resources :expence
end
