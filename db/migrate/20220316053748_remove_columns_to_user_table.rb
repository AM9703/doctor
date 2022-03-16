class RemoveColumnsToUserTable < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :patient_id
    remove_column :users, :doctor_id
  end
end
