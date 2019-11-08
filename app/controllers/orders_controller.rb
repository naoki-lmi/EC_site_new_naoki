class OrdersController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]
  before_action :correct_user,   only: [:new, :create]
  before_action :admin_user,   only: [:index]


  def index
    value = params[:year_month_value]
    @orders = Order.year_search(value)


    total =[]
    @orders.each {|order| total.push(order.product.price * order.quantity)}
    @sum = total.sum

    brand_query = "select  brands.brand as brand, sum(products.price * orders.quantity) as sum from products join orders on (products.id = orders.product_id) join brands on (products.brand_id = brands.id) where  orders.created_at  LIKE '%#{value}%' group by brand order by sum  desc"
    @brand_totals = Order.find_by_sql(brand_query)

    category_query = "select categories.category as category ,sum(products.price * orders.quantity) as sum from products join orders on (products.id = orders.product_id) join categories on (products.category_id = categories.id) where  orders.created_at LIKE '%#{value}%' group by category order by sum desc"
    @category_totals = Order.find_by_sql(category_query)

  end


  def new
    
    @cart = @current_cart
    @cart_items = CartItem.where(cart_id: @cart.id)

    array = []
    @cart_items.each do |item|
      array.push(item.quantity * item.product.price)
    end
    @cart_sum = array.sum
    @user = User.find_by(id: @cart.user_id)

  end

  def create

    @cart = @current_cart
    @cart_items = CartItem.where(cart_id: @cart.id)

    unless @cart_items.present?
      flash[:success] = "予期せぬエラー"
      redirect_to root_path
    else
    

          begin
            ActiveRecord::Base.transaction do
            


              @cart_items.each do |item|
              

              
                @stock = Stock.lock.find_by(product_id: item.product_id)
                @stock.stock -= item.quantity

              
                @order = Order.new(user_id: @cart.user_id, product_id: item.product_id, quantity: item.quantity)
              

                @stock.save!
                @order.save!
              
              end 
            
              #cartとcart_itemの中身を削除
              @cart.destroy!

          end
          flash[:success] = "購入ありがとうございました"
          redirect_to root_path


          rescue => e
                  p "ロールバック"
                  if @cart_items.empty?
                    flash[:error]="予期せぬエラーが出ました"
                    redirect_to root_path
                  else
                    flash[:notice] = "商品の在庫に変更がありました。ご確認ください"
                    redirect_to cart_items_path
                  end
          end
        
    end
    
  
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end


     # 正しいユーザーかどうか確認
     def correct_user
      @user = User.find(session[:user_id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # 管理者かどうか確認
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end





  
end
