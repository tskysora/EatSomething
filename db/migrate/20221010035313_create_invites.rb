class CreateInvites < ActiveRecord::Migration[7.0]
  def change
    create_table :invites do |t|
      t.references :group, null: false, foreign_key: true
      t.string :invite_token

      t.timestamps
    end
    add_index :invites, :invite_token, unique: true
  end
end
