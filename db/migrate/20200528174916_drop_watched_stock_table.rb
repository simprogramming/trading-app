class DropWatchedStockTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :watched_stocks
    add_column :stocks, :price, :integer
    add_column :hot_stocks, :symbol, :string
    add_column :users, :img_avatar, :string
  end
end
