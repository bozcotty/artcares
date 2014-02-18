Artcares::Application.routes.draw do
  
  
  get "patient_campaigns/index"

  get "patient_campaigns/show"

  get "patient_campaigns/new"

  get "patient_campaigns/edit"

  devise_for :users

  resources :artists, only: [:index, :show]
  # artists index would show a list of artists, show would show detail page of artists info for public view
  resources :artworks
  
  resources :users, only: [:index, :show] # for public view

  resources :charges

  get 'dashboard', to: 'welcome#dashboard', as: 'dashboard'
  

 

  get "welcome/index"
  get "welcome/about"
  get "welcome/dashboard"

  root :to => 'welcome#index'
end
