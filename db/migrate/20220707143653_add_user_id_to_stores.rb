class AddUserIdToStores < ActiveRecord::Migration[7.0]
  def change
    add_reference :stores, :user, index: true
    add_foreign_key :stores, :users
  end
end
