Rails.application.routes.draw do
  root 'app/items#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :api, defaults: { format: :json } do
    namespace :internal do
      resources :purchases, only: [:index, :create, :show, :update]
      resources :items, only: [:index, :show]
      resources :reviews, only: [:create]
    end
  end
  devise_for :users
  mount ImageUploader.derivation_endpoint => "/derivations/image"
  mount Sidekiq::Web => '/queue'

  scope module: :app, defaults: { format: :html } do
    resources :purchases, only: [:index, :show]
    resources :items, only: [:show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
