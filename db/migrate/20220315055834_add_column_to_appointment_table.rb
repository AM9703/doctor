class AddColumnToAppointmentTable < ActiveRecord::Migration[6.1]
  def change
    add_column :appointments, :p_id, :integer
    add_column :appointments, :d_id, :integer
  end
end
