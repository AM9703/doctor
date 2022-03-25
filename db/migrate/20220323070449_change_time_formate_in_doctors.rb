class ChangeTimeFormateInDoctors < ActiveRecord::Migration[6.1]
  def change
    change_column :doctors, :start_time, :time
  end
end
