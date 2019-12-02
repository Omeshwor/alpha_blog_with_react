Rails.application.routes.draw do
    resources :articles
    resources :users, except: [:new]
    root "articles#index"
    get 'signup', to: "users#new"
end
