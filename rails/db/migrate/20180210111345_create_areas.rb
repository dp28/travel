class CreateAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :areas do |t|
      t.string :name, null: false
      t.references :country, index: true, null: false

      t.timestamps null: false
    end
  end
end
