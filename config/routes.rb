Rails.application.routes.draw do

  root "pages#about"

  
  get 'error', to: 'pages#error'

  resources :postings

end
