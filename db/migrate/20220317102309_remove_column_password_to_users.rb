class RemoveColumnPasswordToUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :password, :integer
  end
end
