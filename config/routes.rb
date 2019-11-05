Rails.application.routes.draw do

  
  #購入履歴周り
  get 'orders/index'
  resources :orders
  
  #カート周り
  resources :carts
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
