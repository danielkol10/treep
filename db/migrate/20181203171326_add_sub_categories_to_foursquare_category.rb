class AddSubCategoriesToFoursquareCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :foursquare_categories, :sub_categories, :string, array: true, default: []
  end
end
