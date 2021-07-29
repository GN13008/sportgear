Rails.application.routes.draw do
  devise_for :users
  scope '(:locale)', locale: /fr|es/ do
    root to: 'pages#home'
    get "/search", to: "kites#search"
    get "/ui", to: "pages#ui"
    resources :kites, only: [:show]
    # [...]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
