class ModifyPosition < ActiveRecord::Migration[6.0]
  def change
    remove_column :positions, :r2
    remove_column :positions, :r2_hit
    remove_column :positions, :r3
    remove_column :positions, :r3_hit
    rename_column :positions, :baseline, :iceline
    add_column :positions, :target_hit, :boolean, default: false
  end
end
