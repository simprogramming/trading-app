class DropWatchedStockAndAddDirection < ActiveRecord::Migration[6.0]
  def change
    add_column :hot_stocks, :direction, :string
    drop_table :watched_stocks
  end
end
