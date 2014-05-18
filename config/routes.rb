Bloccit::Application.routes.draw do

  devise_for :users
  resources :users, only: [:update]

  resources :topics do
    resources :posts, except: [:index]
  end

  resources :posts

  get 'about' => 'welcome#about'

  #root method allows to declare default page when user types home URL
  root to: 'welcome#index'

end
