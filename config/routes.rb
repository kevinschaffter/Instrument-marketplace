Rails.application.routes.draw do

  devise_for :users
  resources :listings
  get 'contact', to: 'pages#contact'
  get "seller", to: 'listings#seller'
  get 'category', to: 'listings#category'
 
  root to: 'pages#home'

end


