Artcares::Application.routes.draw do
  
  
  devise_for :users

  resources :artists, only: [:index, :show]



  

  get "welcome/index"
  get "welcome/about"

  root :to => 'welcome#index'
end
