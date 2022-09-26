Rails.application.routes.draw do
  root "events#index"

  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  resources :users, param: :username
  resources :events do
    resources :comments, only: %i[create destroy]
    resources :photos, only: %i[create destroy]
    resources :subscriptions, only: %i[create destroy]
    post :show, on: :member
  end
end
