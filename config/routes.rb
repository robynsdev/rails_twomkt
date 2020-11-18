Rails.application.routes.draw do
  get 'search', to: 'posts#search'
  resources :search, only: [:index]
  
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
    
  resources :posts

  get 'listing', to: 'home#ad_listing', as: 'ad_listing'
  get 'home/index'
  root to: 'home#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
