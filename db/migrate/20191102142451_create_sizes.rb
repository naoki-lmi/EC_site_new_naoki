class CreateSizes < ActiveRecord::Migration[5.2]
  def change
    create_table :sizes do |t|
      t.string :size, limit: 2

      t.timestamps
    end
  end
end
