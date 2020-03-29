class ChangeColumnToCoach < ActiveRecord::Migration[5.2]
  def up
    change_column :coaches, :image,:string, null: true 
  end

  def down
    change_column :coaches, :image,:string, null: false
  end
end
