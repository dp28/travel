class ReferenceDayFromPost < ActiveRecord::Migration[5.2]

  def change
    add_column :posts, :day_id, :integer, null: false
    add_index :posts, :day_id
  end

end
