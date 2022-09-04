Rails.application.routes.draw do
  root "events#index"

  devise_for :users, controllers: { registrations: "users/registrations" }
  resources :users
  resources :events do
    resources :comments, only: %i[create destroy]
    resources :subscriptions, only: %i[create destroy]
  end
end
