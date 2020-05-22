Rails.application.routes.draw do
  get 'pages/home'
  resources :posts
  resources :assisteds
  root to: 'pages#home'
  devise_for :users
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
