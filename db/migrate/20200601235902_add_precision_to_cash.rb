class AddPrecisionToCash < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :cash, :float, scale: 2
    change_column :users, :equity, :float, scale: 2
  end
end
