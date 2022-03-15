class RenameTableNameToPaitents < ActiveRecord::Migration[6.1]
  def change
    rename_table :paitents, :Patient
  end
end
