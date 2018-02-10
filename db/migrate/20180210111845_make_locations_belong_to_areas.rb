class MakeLocationsBelongToAreas < ActiveRecord::Migration[5.2]
  def up
    Location.all.destroy_all

    remove_index :locations, :country_id

    change_table :locations do |t|
      t.remove :accommodation, :country_id
      t.references :area, index: true, null: false
      t.rename :place_name, :name
      t.string :type, null: false
    end
  end

  def down
    Location.all.destroy_all

    remove_index :locations, :area_id

    change_table :locations do |t|
      t.remove :area_id, :type
      t.references :country, index: true, null: false
      t.rename :name, :place_name
      t.string :accommodation
    end
  end
end
