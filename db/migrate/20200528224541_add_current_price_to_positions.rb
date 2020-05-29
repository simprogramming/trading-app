class AddCurrentPriceToPositions < ActiveRecord::Migration[6.0]
  def change
    add_column :positions, :current_price, :float
  end
end
