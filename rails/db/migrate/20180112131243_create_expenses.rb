class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.float :amount, null: false
      t.string :currency_code, null: false
      t.string :category, null: false
      t.references :day, null: false, index: true
      t.text :description

      t.timestamps null: false
    end
  end
end
