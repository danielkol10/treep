class ChangeOpenStartToString < ActiveRecord::Migration[5.2]
  def change
    change_column :venues, :open_start, :string
  end
end
