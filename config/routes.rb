Rails.application.routes.draw do
  root "events#index"

  resources :users, param: :username
  resources :events
end
