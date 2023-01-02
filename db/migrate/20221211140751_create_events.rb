class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.references :store, null: false, foreign_key: true
      t.datetime :date
      t.string :period
      t.datetime :deleted_at
      t.references :group, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :events, :deleted_at
  end
end
