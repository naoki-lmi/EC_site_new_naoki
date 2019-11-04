class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.references :cart
      t.references :product
      t.integer :quantity, limit: 3

      t.timestamps
    end
  end
end
