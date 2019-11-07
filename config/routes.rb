Rails.application.routes.draw do

  
  get 'categories/index'
  get 'brands/index'
  resources :brands
  #購入履歴周り
  get 'orders/index'
  resources :orders
  
  #カート周り
  resources :carts
  resources :cart_items
  get '/cart_items', to: 'cart_items#index'
  put '/cart_items', to: 'cart_items#update'
  delete '/cart_items', to: 'cart_items#destroy'

  #プロダクト周り
  root 'products#index'

  resources :products
  #ユーザー周り
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  post  '/credit_confirm', to: 'users#credit_confirm'
  get  '/credit_confirm', to: 'users#credit_user_input'
  resources :users

  #ログイン周り
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

end
