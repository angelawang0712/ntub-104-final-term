class CreateSorts < ActiveRecord::Migration
  def change
    create_table :sorts do |t|
      t.string :sort_name

      t.timestamps null: false
    end
  end
end
