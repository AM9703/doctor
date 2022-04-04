class RemoveColumnFromPrescriptions < ActiveRecord::Migration[6.1]
  def change
    remove_column :prescriptions, :patient_id, :integer
    remove_column :prescriptions, :doctor_id, :integer
  end
end
