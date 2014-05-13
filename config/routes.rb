Bloccit::Application.routes.draw do
  get "welcome/index"
  
  get "welcome/about"

  #root method allows to declare default page when user types home URL
  root to: 'welcome#index'


end
