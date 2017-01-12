Rails.application.routes.draw do

  get 'events/index'

  get 'events/show'

  get "users/show"

  resources :registered_applications do
    resources :events
  end



  devise_for :users

  authenticated :user do
    root "users#show", as: :authenticated_root
  end

  root to: "welcome#index"
end
