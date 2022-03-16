class AddColumnUserIdToPatient < ActiveRecord::Migration[6.1]
  def change
    add_column :patients, :user_id, :integer
  end
end
