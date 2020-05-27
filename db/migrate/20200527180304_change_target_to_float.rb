class ChangeTargetToFloat < ActiveRecord::Migration[6.0]
  def change
    change_column :positions, :target, :float
    change_column :positions, :stop_loss, :float
    change_column :positions, :close_3, :float
    change_column :positions, :close_1, :float
  end

  def change
    add_column :positions, :close_2, :float
  end
end
