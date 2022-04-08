class RemoveRefrencesFromMessages < ActiveRecord::Migration[6.1]
  def change
    remove_reference :messages, :patient, null: false, foreign_key: true
    remove_reference :messages, :doctor, null: false, foreign_key: true
  end
end
