class AddDetailsToMessages < ActiveRecord::Migration[5.0]
  def change
    add_reference :messages, :coach, foreign_key: true
  end
end
