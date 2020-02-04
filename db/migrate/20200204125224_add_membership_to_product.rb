class AddMembershipToProduct < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!

  def change
    add_reference :products, :membership, foreign_key: true, index: false
    add_index :products, :membership_id, algorithm: :concurrently
  end
end
