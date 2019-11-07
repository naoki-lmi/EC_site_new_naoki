class CreateCredits < ActiveRecord::Migration[5.2]
  def change
    create_table :credits do |t|

      t.integer :credit_number, limit: 8
      t.string  :expiration_date, limit: 7
      t.integer :security_code, limit:3
      t.references :user

      t.timestamps
    end
  end
end
