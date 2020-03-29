class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.bigint :user_id, foreign_key:true
      t.bigint :coach_id, foreign_key:true
      t.integer :postal_code, null: false
      t.string :prefecture, null: false
      t.string :city,null: false
      t.string :building_name
      t.string :phone_number, null: false
      t.timestamps
    end
  end
end
