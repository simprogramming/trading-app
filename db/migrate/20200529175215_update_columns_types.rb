class UpdateColumnsTypes < ActiveRecord::Migration[6.0]
  def change
    remove_column :positions, :buy_sell
    remove_column :positions, :entry

    add_column :positions, :buy_sell, :string
    add_column :positions, :entry, :float
  end
end
