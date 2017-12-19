Rails.application.routes.draw do

  root to: "postings#index"

  resources :postings

end
