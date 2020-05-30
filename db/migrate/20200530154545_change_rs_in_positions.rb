class ChangeRsInPositions < ActiveRecord::Migration[6.0]
  def change
    rename_column :positions, :R1, :r1
    rename_column :positions, :R2, :r2
    rename_column :positions, :R3, :r3
  end
end
