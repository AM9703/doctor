class CreateDoctors < ActiveRecord::Migration[6.1]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :specialization
      t.decimal :fees
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
