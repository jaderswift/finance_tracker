Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "user/registrations" }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_stocks', to: 'stocks#search'
  resources :user_stocks, only: [:create, :destroy]
  resources :user
end