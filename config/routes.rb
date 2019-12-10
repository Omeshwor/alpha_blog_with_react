Rails.application.routes.draw do
    resources :articles
    resources :users, except: [:new]

    root "articles#index"

    get     'signup',   to: "users#new"

    get     'login',    to: "sessions#new"
    post    'login',    to: "sessions#create"
    delete  'logout',   to: "sessions#destroy"
end
