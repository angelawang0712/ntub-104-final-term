class DeleteAndAddAccount < ActiveRecord::Migration
  def change
    add_column  :Accounts, :sort_id, :integer
    remove_column  :Accounts, :store_id
  end
end
