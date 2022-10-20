Rails.application.routes.draw do
  get "tasks/generate_report"
  get "users/logs"
  resources :developer_task_mappings
  devise_for :users
  resources :tasks
  resources :users
  #get 'home/index'
  root 'home#index'

  
 
   
  
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
