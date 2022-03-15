class RenameTableNameToPatient < ActiveRecord::Migration[6.1]
  def change
    rename_table :patient, :patients
  end
end
