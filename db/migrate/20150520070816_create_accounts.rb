class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.integer :buy_price
      t.integer :num
      t.date :buy_date
      t.string :buy_store
      t.integer :store_id

      t.timestamps null: false
    end
  end
end
