class AddRefrenceToMessages < ActiveRecord::Migration[6.1]
  def change
    add_reference :messages, :patient, null: false, foreign_key: true
  end
end
