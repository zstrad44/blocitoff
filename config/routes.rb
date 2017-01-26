Rails.application.routes.draw do
 
  # get 'items/create'

  devise_for :users
    
  resources :users do
    resources :items, only: :create
  end

  get 'welcome/about'
  
  authenticated :user do
    root 'users#dashboard', as: :authenticated_root
  end
  
  root 'welcome#index'

end
