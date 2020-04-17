class CreatePugs < ActiveRecord::Migration[6.0]
  def change
    create_table :pugs, id: :uuid  do |t|
      t.string :name, null: false
      t.integer :age, default: 0

      t.timestamps
    end
  end
end
