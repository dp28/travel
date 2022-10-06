class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :url, null: false
      t.string :caption, null: true
      t.references :day, null: false, index: true
      t.boolean :favourite, null: false, default: false

      t.timestamps null: false
    end

    add_index :photos, [:url, :day_id], unique: true
  end
end
