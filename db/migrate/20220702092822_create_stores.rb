class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :branch
      t.string :city
      t.string :district
      t.string :street_address
      t.string :tel
      t.string :opening
      t.text :note
      t.boolean :online, default: true
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :stores, :name
    add_index :stores, :city
    add_index :stores, :branch
    add_index :stores, :online
    add_index :stores, :deleted_at
  end
end
