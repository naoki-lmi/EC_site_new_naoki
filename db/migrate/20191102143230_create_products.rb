class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, limit: 60
      t.references :brand
      t.references :category
      t.references :color
      t.references :image
      t.references :size
      t.integer :price, limit: 4

      t.timestamps
    end
  end
end