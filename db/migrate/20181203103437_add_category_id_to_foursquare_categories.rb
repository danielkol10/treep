class AddCategoryIdToFoursquareCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :foursquare_categories, :category_id, :string
  end
end
