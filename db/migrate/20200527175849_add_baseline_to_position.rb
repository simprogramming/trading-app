class AddBaselineToPosition < ActiveRecord::Migration[6.0]
  def change
    add_column :positions, :baseline, :float
  end
end
