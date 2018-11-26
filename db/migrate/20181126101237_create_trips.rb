class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :city
      t.date :start_day
      t.date :end_day
      t.integer :number_of_people
      t.string :budget
      t.string :category
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
