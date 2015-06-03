class DeleteAndAddCost < ActiveRecord::Migration
  def change
    add_column  :Costs, :sort_id, :integer
    remove_column  :Costs, :store_id
  end
end
