Bloccit::Application.routes.draw do

  devise_for :users
  resources :users, only: [:update]

  resources :topics do
    resources :posts, except: [:index]
  end

  # Nesting the 'comments' resource of 'create' under /posts/id type url
  resources :posts do
    resources :comments, only: [:create, :new]
  end

  resources :posts

  get 'about' => 'welcome#about'

  #root method allows to declare default page when user types home URL
  root to: 'welcome#index'

end
