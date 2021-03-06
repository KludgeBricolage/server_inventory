Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "servers#index"

  resources :servers
  resources :spares
  resources :users, controller: "admins"

  get "spare/:category", to: "spares#index", as: "spares_category"
end
