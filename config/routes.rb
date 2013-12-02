Artcares::Application.routes.draw do
  
  
  devise_for :users

  resources :artists, only: [:index, :show]
  resources :artworks
  




  

  get "welcome/index"
  get "welcome/about"

  root :to => 'welcome#index'
end
