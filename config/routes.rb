Rails.application.routes.draw do

  devise_for :users
  resources :listings
  get 'contact', to: 'pages#contact'
 
  root to: 'pages#home'

end


