class AddCost < ActiveRecord::Migration
  def change
    add_column  :Costs, :start_time , :date
    add_column  :Costs, :end_time , :date
    remove_column  :Costs, :cost_period
  end
end
