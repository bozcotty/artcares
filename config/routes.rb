Artcares::Application.routes.draw do
  
  
  devise_for :artists

  get "welcome/index"
  get "welcome/about"

  root :to => 'welcome#index'
end
