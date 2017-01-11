Rails.application.routes.draw do

  get "users/show"

  resources :registered_applications

  devise_for :users

  authenticated :user do
    root "users#show", as: :authenticated_root
  end

  root to: "welcome#index"
end
