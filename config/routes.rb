Artcares::Application.routes.draw do
  
  
  
  devise_for :users

  resources :artists, only: [:index, :show]
  # artists index would show a list of artists, show would show detail page of artists info for public view
  
  resources :patient_campaigns

  resources :patient_campaigns do
    resources :artworks
  end
  
  resources :users, only: [:index, :show] # for public view

  resources :charges

  get 'dashboard', to: 'welcome#dashboard', as: 'dashboard'
  

 

  get "welcome/index"
  get "welcome/about"
  get "welcome/dashboard"

  root :to => 'welcome#index'
end
