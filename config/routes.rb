Rails.application.routes.draw do
  resources :users
  resources :subscription_plans
  resources :additional_services
  resources :subscription_packs
  resources :signatures
  get "up" => "rails/health#show", as: :rails_health_check
end
