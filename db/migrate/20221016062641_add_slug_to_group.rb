class AddSlugToGroup < ActiveRecord::Migration[7.0]
  def up
    add_column :groups, :slug, :string
    add_index :groups, :slug, unique: true
  end
end
