require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"
  resources :users do
    collection do
      delete :deleteall
    end
  end 

  post "seedusers", to: "users#seed_users"

  namespace :api do
    namespace :v1 do
      resources :users
    end
  end
  root "pages#home"
end
