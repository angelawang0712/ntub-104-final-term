class CreateCosts < ActiveRecord::Migration
  def change
    create_table :costs do |t|
      t.string :cost_name
      t.integer :cost_price
      t.date :cost_period
      t.integer :store_id

      t.timestamps null: false
    end
  end
end
