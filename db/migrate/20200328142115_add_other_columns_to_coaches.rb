class AddOtherColumnsToCoaches < ActiveRecord::Migration[5.2]
  def change
    add_column :coaches, :family_name, :string, null: false
    add_column :coaches, :first_name, :string, null: false
    add_column :coaches, :family_name_kana, :string, null: false
    add_column :coaches, :first_name_kana, :string, null: false
  end
end
