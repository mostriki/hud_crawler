Rails.application.routes.draw do

  devise_for :users
  root "pages#home"

  
  get 'error', to: 'pages#error'

  resources :postings

end
