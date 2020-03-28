class AddColumnToCoaches < ActiveRecord::Migration[5.2]
  def change
    add_column :coaches, :image,  :string,null: false
    add_column :coaches, :age,    :integer,null: false
    add_column :coaches, :request,:text,null: false
  end
end
