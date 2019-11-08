class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :current_cart
    include SessionsHelper

    helper_method :current_cart

    
    

    private
def current_cart
  if cart = Cart.find_by(:user_id => session[:user_id])
       @current_cart = cart
  else
      if session[:cart_id]
         cart = Cart.find_by(:id => session[:cart_id])
         if cart.present?
           @current_cart = cart
         else
           session[:cart_id] = nil
         end
       
      end
     if cart == nil
       @current_cart = Cart.create
       @current_cart.user_id = session[:user_id]
       @current_cart.save
       session[:cart_id] = @current_cart.id
     end
  end
end

    
end

