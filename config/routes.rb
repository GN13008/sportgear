Rails.application.routes.draw do
  devise_for :users
  scope '(:locale)', locale: /fr|es/ do
    root to: 'pages#home'
    get "/Kitesurf", to: "kites#search", as: :kitesurf_search
    get "/Wingfoil", to: "foils#wing_search", as: :wingfoil_search
    get "/Kitefoil", to: "foils#kite_search", as: :kitefoil_search
    get "/ui", to: "pages#ui"
    resources :kites, only: [:show]
    resources :sports, only: [:show]
    resources :schools, only: [:index]
    # [...]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
