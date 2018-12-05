class AddFacebookToVenues < ActiveRecord::Migration[5.2]
  def change
    add_column :venues, :facebook, :string
  end
end
