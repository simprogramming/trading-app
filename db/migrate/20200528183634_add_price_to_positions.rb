class AddPriceToPositions < ActiveRecord::Migration[6.0]
  def change
    add_column :positions, :bid, :float
  end
end
