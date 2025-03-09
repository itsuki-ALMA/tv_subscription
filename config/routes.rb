Rails.application.routes.draw do
  resources :users
  resources :subscription_plans
  get "up" => "rails/health#show", as: :rails_health_check
end
