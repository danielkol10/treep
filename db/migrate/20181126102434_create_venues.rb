class CreateVenues < ActiveRecord::Migration[5.2]
  def change
    create_table :venues do |t|
      t.string :name
      t.time :open_start
      t.time :open_end
      t.integer :days
      t.string :location
      t.references :trip, foreign_key: true

      t.timestamps
    end
  end
end
