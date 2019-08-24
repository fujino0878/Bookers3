Rails.application.routes.draw do
root to: "users#top"
  devise_for :users
  get '/home/about', to: 'users#about'
  get '/users/sign_in', to: 'users#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  resources :users, only:[:new, :create,:index,:show,:edit,:update,:destroy,:about]
  
end
