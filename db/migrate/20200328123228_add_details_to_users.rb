class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :image,  :string
    add_column :users, :age,    :integer
    add_column :users, :request,:text
  end
end
