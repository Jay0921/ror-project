class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :model
      t.text :description
      t.string :image_id
      t.integer :status, default: 0
      t.boolean :featured

      t.timestamps
    end

    add_index :products, :name, unique: true
  end
end
