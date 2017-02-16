Rails.application.routes.draw do

  devise_for :users
    
  resources :users do
    resources :items, only: [:create, :destroy, :update]
  end

  get 'welcome/about'
  
  authenticated :user do
    root 'users#dashboard', as: :authenticated_root
  end
  
  root 'welcome#index'

end
