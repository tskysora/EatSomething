class AddUserIdToGroup < ActiveRecord::Migration[7.0]
  def change
    add_reference :groups, :user, index: true
    add_foreign_key :groups, :users
  end
end
