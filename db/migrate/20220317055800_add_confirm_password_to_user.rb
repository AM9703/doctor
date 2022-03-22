class AddConfirmPasswordToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :confirm_password, :integer
  end
end
