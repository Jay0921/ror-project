class AddRoleToUsers < ActiveRecord::Migration[6.0]
  def up
    add_column :users, :role, :integer
    change_column_default :users, :role, 0
  end

  def down
    remove_column :users, :role
  end
end
