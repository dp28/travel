class CreateAccommodations < ActiveRecord::Migration[5.2]
  def change
    create_table :accommodations do |t|
      t.belongs_to :day, index: true, null: false
      t.belongs_to :location, index: true, null: false

      t.timestamps null: false
    end
  end
end
