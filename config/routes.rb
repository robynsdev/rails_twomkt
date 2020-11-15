Rails.application.routes.draw do
  get 'search', to: 'posts#search'
  resources :search, only: [:index]
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  post 'checkout', to: 'stripe#checkout'
  get  'checkout/success', to: 'stripe#success', as: 'successful_checkout'

    
  devise_for :users
  resources :posts

  get 'home/index'
  # get '*path', to: 'home#index', via: :all
  root 'home#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
