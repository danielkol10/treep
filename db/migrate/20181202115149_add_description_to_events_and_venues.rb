class AddDescriptionToEventsAndVenues < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :description, :string
    add_column :venues, :description, :string
  end
end
