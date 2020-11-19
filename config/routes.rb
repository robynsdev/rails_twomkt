Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  get 'search', to: 'posts#search'
  resources :search, only: [:index]
  resources :posts
  resources :posts do
    resources :offers
  end
  get 'listing', to: 'home#ad_listing', as: 'ad_listing'
  get 'home/index'
  root to: 'home#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
