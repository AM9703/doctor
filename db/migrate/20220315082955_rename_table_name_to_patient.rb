class RenameTableNameToPatient < ActiveRecord::Migration[6.1]
  def change
    rename_table :Patient, :patients
  end
end
