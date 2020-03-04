class AddDeletedAtToUsers < ActiveRecord::Migration[6.0]
  def up
    add_column :users, :deleted_at, :datetime
    commit_db_transaction
    add_index :users, :deleted_at, algorithm: :concurrently
  end

  def down
    remove_column :users, :deleted_at
  end
end
