Rails.application.routes.draw do
  resources :posts
  get 'pages/home'
  devise_for :users
  resources :assisteds
  root to: 'pages#home'
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
