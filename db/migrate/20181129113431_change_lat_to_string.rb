class ChangeLatToString < ActiveRecord::Migration[5.2]
  def change
    change_column :trips, :latitude, :string
    change_column :trips, :longitude, :string
  end
end
