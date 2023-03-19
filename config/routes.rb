require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"
  resources :users
  post "seedusers", to: "pages#seed_users"

  namespace :api do
    namespace :v1 do
      resources :users
    end
  end
  root "pages#home"
end
