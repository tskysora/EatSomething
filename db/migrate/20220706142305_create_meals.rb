class CreateMeals < ActiveRecord::Migration[7.0]
  def change
    create_table :meals do |t|
      t.string :name
      t.integer :price
      t.string :description
      t.references :store, null: false, foreign_key: true
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :meals, :deleted_at
  end
end
