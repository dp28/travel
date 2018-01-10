class CreateDays < ActiveRecord::Migration[5.2]
  def change
    create_table :days do |t|
      t.integer :number, null: false
      t.timestamps null: false
    end

    add_index :days, :number, unique: true
  end
end
