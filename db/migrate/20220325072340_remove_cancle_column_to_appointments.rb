class RemoveCancleColumnToAppointments < ActiveRecord::Migration[6.1]
  def change
    remove_column :appointments, :cancle, :string
  end
end
