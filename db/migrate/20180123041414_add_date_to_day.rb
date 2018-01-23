class AddDateToDay < ActiveRecord::Migration[5.2]

  def change
    add_column :days, :date, :date, null: false
  end

end
