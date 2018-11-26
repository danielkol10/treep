class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :event_start
      t.datetime :event_end
      t.string :location
      t.references :trip, foreign_key: true

      t.timestamps
    end
  end
end
