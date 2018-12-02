class RemoveVenuesDays < ActiveRecord::Migration[5.2]
  def change
    remove_column :venues, :days
  end
end
