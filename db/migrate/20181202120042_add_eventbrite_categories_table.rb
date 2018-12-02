class AddEventbriteCategoriesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :eventbrite_categories do |t|
      t.string :name
      t.string :name_slug
    end

    create_table :foursquare_categories do |t|
      t.string :name
      t.string :img_url
    end
  end
end
