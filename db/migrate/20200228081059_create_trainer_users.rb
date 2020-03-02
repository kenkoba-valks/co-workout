class CreateTrainerUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :trainer_users do |t|
      t.references :trainer, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
