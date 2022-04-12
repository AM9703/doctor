class ChangeDateTypeInAppointments < ActiveRecord::Migration[6.1]
  def change
    change_column :appointments, :date, :datetime
  end
end
