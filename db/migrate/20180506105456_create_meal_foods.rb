class CreateMealFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :meal_foods do |t|
      t.belongs_to :meal, index: true, null: false
      t.belongs_to :food, index: true, null: false

      t.timestamps null: false
    end
  end
end
