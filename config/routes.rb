Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :listings do 
    resources :contact_owner, only: [:create]
  end

  get 'contact', to: 'pages#contact'
  get "seller", to: 'listings#seller'
 
  root to: 'pages#home'

end


