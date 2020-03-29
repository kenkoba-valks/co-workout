class AddBirthDayToCoaches < ActiveRecord::Migration[5.2]
  def change
    add_column :coaches, :birth_day, :date,null: false
  end
end
