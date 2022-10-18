class RemoveInviteTokenToGroup < ActiveRecord::Migration[7.0]
  def change
    remove_column :groups, :invite_token, :string
    remove_index :groups, :invite_token, if_exists: true
  end
end
