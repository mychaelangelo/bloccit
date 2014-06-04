Bloccit::Application.routes.draw do

  devise_for :users

  resources :users, only: [:show, :index, :update]

  resources :posts, only: [:index]
  
  resources :topics do
    resources :posts, except: [:index], controller: 'topics/posts' do
      resources :comments, only: [:create, :destroy]

      # manual routes for vote links
      get '/up-vote' => 'votes#up_vote', as: :up_vote
      get '/down-vote' => 'votes#down_vote', as: :down_vote

      # routes for the Favorite links
      resources :favorites, only: [:create, :destroy]
    end
  end


  resources :posts

  get 'about' => 'welcome#about'

  #root method allows to declare default page when user types home URL
  root to: 'welcome#index'

end
