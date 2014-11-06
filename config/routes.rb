Artcares::Application.routes.draw do



  devise_for :users, controllers: { registrations: 'users/registrations' }

  # artists index would show a list of artists, show would show detail page of artists info for public view



  resources :campaigns do
    resources :artworks do
      post :buy
    end
  end

  resources :users, only: [:index, :show] # for public view

  resources :charges

  resources :messages, only: [:new, :create] #for contact us page

  get 'dashboard', to: 'welcome#dashboard', as: 'dashboard'

  get "welcome/index"
  get "welcome/about"
  get "welcome/dashboard"
  get "welcome/learn"
  get "welcome/artists_join_us"
  get "welcome/terms_of_use"
  get "welcome/faq"
  get "welcome/fees"


  get 'search', to: 'search#index'

  # match "facebook" => "http://www.facebook.com"
  match "/facebook" => redirect("http://facebook.com/artcaring"), :as => :facebook
  match "/twitter" => redirect("http://twitter.com/artcaring1"), :as => :twitter

  root :to => 'welcome#index'

  # Shop By Routes:

  resources :artworks, only: :index

  # get "artworks/index_painting"
  # get "artworks/index_drawing"
  # get "artworks/index_mixed_media"
  # get "artworks/index_printmaking"
  # get "artworks/index_photography"
  # get "artworks/index_sculpture"
  # get "artworks/index_ceramics"
  # get "artworks/index_jewelry"
  # get "artworks/index_wood"
  # get "artworks/index_metal"
  # get "artworks/index_glass"
  # get "artworks/index_fiber"

  get "artworks/search"


end
