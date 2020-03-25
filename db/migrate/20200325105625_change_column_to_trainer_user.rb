class ChangeColumnToTrainerUser < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :trainer_users, :trainers
    remove_index :trainer_users, :trainer_id
    remove_reference :trainer_users, :trainer
  end
end
