class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.belongs_to :day, index: true, null: false
      t.integer :ordering, null: false

      t.timestamps null: false
    end

    add_index :meals, [:day_id, :ordering], unique: true
  end
end
