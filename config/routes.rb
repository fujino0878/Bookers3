Rails.application.routes.draw do
root to: "users#top"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, only:[:show, :edit, :update, :index,:create]
  resources :users, only:[:new, :create,:index,:show,:edit,:update,:destroy]
  
end