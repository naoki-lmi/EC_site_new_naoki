class ChangeColumCartItem < ActiveRecord::Migration[5.2]
  def change
    change_column :cart_items, :quantity, :integer, limit: 3, null: false, default: 1
  end
end
