class ChangeOpenEndToString < ActiveRecord::Migration[5.2]
  def change
    change_column :venues, :open_end, :string
  end
end
