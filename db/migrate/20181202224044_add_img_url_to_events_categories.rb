class AddImgUrlToEventsCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :eventbrite_categories, :img_url, :string
  end
end
