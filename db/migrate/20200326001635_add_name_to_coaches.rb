class AddNameToCoaches < ActiveRecord::Migration[5.0]
  def change
    add_column :coaches, :name, :string, null: false
    add_index  :coaches, :name
  end
end
