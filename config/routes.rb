Rails.application.routes.draw do
 

  devise_for :users
    
  resources :users, only: [:index, :show, :edit, :update]
  
  get 'welcome/about'
  
  root 'welcome#index'

end
