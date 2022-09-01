Rails.application.routes.draw do
  root "events#index"

  devise_for :users, controllers: { registrations: "users/registrations" }
  resources :users, param: :username
  resources :events
end
