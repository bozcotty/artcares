Artcares::Application.routes.draw do
  
  
  devise_for :users

  resources :artists, only: [:index, :show]
  # artists index would show a list of artists, show would show detail page of artists info for public view
  resources :artworks
  
  resources :users, only: [:index, :show] # create a route for users to see their index of artworks
  

 

  get "welcome/index"
  get "welcome/about"
  get "welcome/dashboard"

  root :to => 'welcome#index'
end
