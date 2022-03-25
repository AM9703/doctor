class RemoveColumnDateFromDoctors < ActiveRecord::Migration[6.1]
  def change
    remove_column :doctors, :date, :date
  end
end
