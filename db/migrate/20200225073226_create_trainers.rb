class CreateTrainers < ActiveRecord::Migration[5.0]
  def change
    create_table :trainers do |t|
      t.text :name
      t.text :age
      t.text :area
      t.text :comment
      t.timestamps
    end
  end
end
