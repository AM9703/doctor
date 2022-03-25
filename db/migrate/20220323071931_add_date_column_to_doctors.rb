class AddDateColumnToDoctors < ActiveRecord::Migration[6.1]
  def change
    add_column :doctors, :date, :date
  end
end
