class CreateTrayItems < ActiveRecord::Migration[7.0]
  def change
    create_table :tray_items do |t|
      t.references :tray, null: false, foreign_key: true
      t.references :meal, null: false, foreign_key: true
      t.integer :quantity
      t.string :note

      t.timestamps
    end
  end
end
