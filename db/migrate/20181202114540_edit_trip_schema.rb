class EditTripSchema < ActiveRecord::Migration[5.2]
  def change
    remove_column :trips, :number_of_people
    remove_column :trips, :budget
    remove_column :trips, :category
  end
end
