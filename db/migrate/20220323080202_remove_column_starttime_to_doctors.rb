class RemoveColumnStarttimeToDoctors < ActiveRecord::Migration[6.1]
  def change
    remove_column :doctors, :start_time, :time
  end
end
