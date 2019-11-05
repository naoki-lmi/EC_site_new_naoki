class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user
      t.references :product
      t.integer :quantity, limit: 3

      t.timestamps
    end
  end
end
