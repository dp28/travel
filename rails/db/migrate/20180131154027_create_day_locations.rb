class CreateDayLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :day_locations do |t|
      t.references :day, null: false
      t.references :location, null: false
      t.timestamps null: false
    end

    add_index :day_locations, [:day_id, :location_id], unique: true
  end
end
