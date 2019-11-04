Rails.application.routes.draw do
  #カート周り
  resources :cart_items
  #プロダクト周り
  root 'products#index'

  resources :products
  #ユーザー周り
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  
  resources :users

  #ログイン周り
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

end
