class DeleteAndAddSort < ActiveRecord::Migration
  def change
    add_column  :Sorts, :title, :string
    remove_column  :Sorts, :sort_name
  end
end
