class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :place_name, null: false
      t.string :accommodation
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.references :country, index: true, null: false

      t.timestamps null: false
    end
  end
end
