class AddPrecisionToCashAndEquity < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :cash, default: 100000, precision: 2
    change_column :users, :equity, default: 0, precision: 2
  end
end
