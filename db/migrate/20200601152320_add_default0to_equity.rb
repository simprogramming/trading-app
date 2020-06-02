class AddDefault0toEquity < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :equity, :float, default: 0
  end
end
