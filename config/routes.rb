Rails.application.routes.draw do

  devise_for :users
  root "pages#about"

  
  get 'error', to: 'pages#error'

  resources :postings

end
