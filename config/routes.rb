Bloccit::Application.routes.draw do

  resources :posts

  get 'about' => 'welcome#about'

  #root method allows to declare default page when user types home URL
  root to: 'welcome#index'


end
