class AddImgUrlToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :img_url, :string
  end
end
