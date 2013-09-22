Olongkar::Application.routes.draw do
  get "oauths/oauth"

  get "oauths/callback"

  get "password_resets/create"

  get "password_resets/edit"

  get "password_resets/update"

  # config/routes.rb
  resources :sessions
  resources :users
  resources :password_resets

  match 'login' => 'sessions#new', :as => :login
  match 'logout' => 'sessions#destroy', :as => :logout
  match "oauth/callback" => "oauths#callback"
  match "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider
  root :to => 'users#index'
end