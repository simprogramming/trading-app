class AddSymbolToWatchedStock < ActiveRecord::Migration[6.0]
  def change
    add_column :watched_stocks, :symbol, :string
    add_column :watched_stocks, :category, :string
  end
end
