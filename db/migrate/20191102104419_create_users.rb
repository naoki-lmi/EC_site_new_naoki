class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, limit: 60
      t.string :email
      t.string :address, limit: 100

      t.timestamps
    end
  end
end
