class AddWrittenAtToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :written_at, :datetime, null: false
  end
end
