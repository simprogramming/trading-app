class SchemaFinal1 < ActiveRecord::Migration[6.0]
  def change
    rename_column :positions, :entry_1, :entry
    rename_column :positions, :quantity_1, :size
    rename_column :positions, :close_1, :R1
    rename_column :positions, :close_2, :R2
    rename_column :positions, :close_3, :R3

    rename_column :positions, :bid, :buy_sell
  end
end
