class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :birth_day, :date, null: false
  end
end
