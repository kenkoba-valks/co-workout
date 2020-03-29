class DropTableTrainerUsers < ActiveRecord::Migration[5.0]
  def change
    drop_table :trainer_users
  end
end
