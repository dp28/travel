class AddDimensionsToPhotos < ActiveRecord::Migration[5.2]
  def change
    Photo.destroy_all
    add_column :photos, :width, :integer, null: false
    add_column :photos, :height, :integer, null: false
  end
end
