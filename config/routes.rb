require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"
  post "seedusers", to: "pages#seed_users"
  root "pages#home"
end
