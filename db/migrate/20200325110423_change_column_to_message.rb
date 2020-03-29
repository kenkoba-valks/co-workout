class ChangeColumnToMessage < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :messages, :trainers
    remove_index :messages, :trainer_id
    remove_reference :messages, :trainer
  end
end
