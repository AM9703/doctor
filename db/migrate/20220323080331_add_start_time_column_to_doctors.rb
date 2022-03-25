class AddStartTimeColumnToDoctors < ActiveRecord::Migration[6.1]
  def change
    add_column :doctors, :start_time, :datetime
  end
end
