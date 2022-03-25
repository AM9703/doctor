class AddCancleFieldToAppointments < ActiveRecord::Migration[6.1]
  def change
    add_column :appointments, :cancle, :string
  end
end
