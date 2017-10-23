Rails.application.routes.draw do
 

  get 'authors', to: 'pages#authors'

  get 'titles', to: 'pages#titles'

  resources :blogs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "pages#home"
end
