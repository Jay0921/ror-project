class CreateCatalogueProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :catalogue_products do |t|
      t.string :code, null: false
      t.integer :point, null: false
      t.references :product, index: true, foreign_key: true
      t.references :catalogue, index: true, foreign_key: true

      t.timestamps
    end

    add_index :catalogue_products, :code, unique: true
  end
end
