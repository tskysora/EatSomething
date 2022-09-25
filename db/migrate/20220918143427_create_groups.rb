class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :description
      t.string :invite_token
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :groups, :deleted_at
    add_index :groups, :invite_token, unique: true
  end
end
