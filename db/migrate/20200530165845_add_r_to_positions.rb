class AddRToPositions < ActiveRecord::Migration[6.0]
  def change
    add_column :positions, :r1, :float
    add_column :positions, :r2, :float
    add_column :positions, :r3, :float
  end
end
