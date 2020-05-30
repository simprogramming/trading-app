class RemoveColumnForPositions < ActiveRecord::Migration[6.0]
  def change
    remove_column :positions, :R1
    remove_column :positions, :R2
    remove_column :positions, :R3
  end
end
