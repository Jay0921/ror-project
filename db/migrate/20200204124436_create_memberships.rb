class CreateMemberships < ActiveRecord::Migration[6.0]
  def change
    create_table :memberships do |t|
      t.string :name, null: false
      t.text :message

      t.timestamps
    end

    add_index :memberships, :name, unique: true
  end
end
