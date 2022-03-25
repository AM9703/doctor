class AddColumnToAppointments < ActiveRecord::Migration[6.1]
  def change
    add_column :appointments, :date , :date
    add_column :appointments, :time, :time
  end
end
