Rails.application.routes.draw do


resources :tasks
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

resources :search, only: [:index]


  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
