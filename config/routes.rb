Rails.application.routes.draw do

  get 'events/index'

  get 'events/show'

  get "users/show"

  resources :registered_applications do
    resources :events
  end

  namespace :api, defaults: { format: :json } do
    match '/events', to: 'events#preflight', via: [:options]
    resources :events, only: [:create]
  end

  devise_for :users

  authenticated :user do
    root "users#show", as: :authenticated_root
  end

  root to: "welcome#index"
end
