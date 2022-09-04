class StoresCityToCounty < ActiveRecord::Migration[7.0]
  def change
    rename_column :stores, :city, :county
  end
end
