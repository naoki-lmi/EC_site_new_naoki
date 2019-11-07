class CartItemsController < ApplicationController
  def create
    product = Product.find(params[:product_id])
    @cart_item = @current_cart.add_quantity(product.id)
    

    if @cart_item.save
      flash[:success] = "買い物カゴに追加しました"
      redirect_to cart_items_path
      
    else
      flash[:notice] = "在庫がありません"
      redirect　products_show_path
    end
    
  end
  
 

  def index
    @cart = @current_cart
   
    @cart_items = CartItem.where(cart_id: @cart.id)

    array = []
    @cart_items.each do |item|
      array.push(item.quantity * item.product.price)
    end
    @cart_sum = array.sum
  end



  def update
    judge = params[:judge]
    

    if judge == "1"

      product = Product.find(params[:product_id])
      cart_item = @current_cart.add_quantity(product.id)
      cart_item.save
      flash[:success] = "#{product.name}の数量を増やしました"
      redirect_to cart_items_path

    else
      @product = Product.find(params[:product_id])
      @cart_item = @current_cart.delete_quantity(@product.id)
      @cart_item.save
      flash[:success] = "#{@product.name}の数量を減らしました"
      redirect_to cart_items_path
    end


  end

  def destroy
    @cart = Cart.find_by(user_id: session[:user_id])
    cart_items_delete = CartItem.where(cart_id: @cart)

    #cart = @cart.id
    #productid = @cart_items.find_by(product_id: params[:product_id]
    cart_items_delete.find_by(product_id: params[:product_id]).delete

    #query = "delete from cart_items where cart_id = #{cart} and product_id = #{product}"
    #CartItem.find_by_sql(query)

    product = Product.find(params[:product_id])

    flash[:success] = "#{product.name}を削除しました"
    redirect_to cart_items_path



  end






end
