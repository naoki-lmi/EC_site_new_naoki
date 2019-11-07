class OrdersController < ApplicationController
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

  end

  def create
    begin
      ActiveRecord::Base.transaction do
        .
        .
        raise 'ロールバックします'
      end
    
      p 'コミット' # トランザクション処理を確定
    rescue => e
      p 'ロールバック' # トランザクション処理を戻す
    end
    
  
  end

  
end
