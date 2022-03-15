class RenameColumnToAppointments < ActiveRecord::Migration[6.1]
  def change
    rename_column :appointments, :p_id, :patient_id
    rename_column :appointments, :d_id, :doctor_id
  end
end
