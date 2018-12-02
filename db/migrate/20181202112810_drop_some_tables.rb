class DropSomeTables < ActiveRecord::Migration[5.2]
  def change
    drop_table :trip_categories
  end
end
