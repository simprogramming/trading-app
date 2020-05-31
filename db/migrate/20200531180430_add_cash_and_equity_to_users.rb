class AddCashAndEquityToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :cash_plus_equity, :float
  end
end
