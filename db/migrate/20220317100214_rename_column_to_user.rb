class RenameColumnToUser < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :confirm_password, :password_confirmation
  end
end
