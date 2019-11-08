class Cart < ApplicationRecord
    belongs_to :user

    has_many :cart_items, :dependent => :destroy

    def add_cart(product_id)
      current_item = cart_items.find_by(product_id: product_id)
      if current_item 
        current_item
      else
        current_item = cart_items.build(product_id: product_id)
      end
  end

    


    def add_quantity(product_id)
        current_item = cart_items.find_by(product_id: product_id)
        if current_item
          current_item.quantity +=1
        else
          current_item = cart_items.build(product_id: product_id)
        end
        current_item
    end

    def delete_quantity(product_id)
      current_item = cart_items.find_by(product_id: product_id)
      if current_item
        current_item.quantity -=1
      else
        current_item = cart_items.build(product_id: product_id)
      end
      current_item
  end


end
