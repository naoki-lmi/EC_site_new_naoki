class CartItemsController < ApplicationController
  def create
    @cart = current_cart
    

    
  end

  def index
  
   @cart_items = CartItem.where(:cart_id => 1)
  end


end
