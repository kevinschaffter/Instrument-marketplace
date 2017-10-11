Rails.application.routes.draw do

  resources :listings
  get 'contact', to: 'pages#contact'
 
  root to: 'pages#home'

end


