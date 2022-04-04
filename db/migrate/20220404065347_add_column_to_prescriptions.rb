class AddColumnToPrescriptions < ActiveRecord::Migration[6.1]
  def change
    add_column :prescriptions, :prescription, :text
    add_column :prescriptions, :doctor_id, :integer
    add_column :prescriptions, :patient_id, :integer
    add_column :prescriptions, :appointment_id, :integer
  end
end
