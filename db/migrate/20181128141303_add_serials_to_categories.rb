class AddSerialsToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :serials, :string, array: true, default: []
  end
end
