Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/search", to: "kites#search"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
