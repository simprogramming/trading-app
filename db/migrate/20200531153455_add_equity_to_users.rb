class AddEquityToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :wallet, :equity
    add_column :users, :cash, :float
  end
end
