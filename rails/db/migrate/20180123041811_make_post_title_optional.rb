class MakePostTitleOptional < ActiveRecord::Migration[5.2]

  def up
    change_column :posts, :title, :string, null: true
  end

  def down
    change_column :posts, :title, :string, null: false
  end

end
