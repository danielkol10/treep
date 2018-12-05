class AddDetailsToVenues < ActiveRecord::Migration[5.2]
  def change
    add_column :venues, :phone, :string
    add_column :venues, :instagram, :string
    add_column :venues, :category_tag, :string
    add_column :venues, :web_url, :string
    add_column :venues, :price_tier, :string
    add_column :venues, :likes, :string
    add_column :venues, :rating, :string
    add_column :venues, :days_hours, :string, array: true, default: []
  end
end
