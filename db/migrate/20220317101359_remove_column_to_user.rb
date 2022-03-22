class RemoveColumnToUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :password_confirmation, :password
  end
end
