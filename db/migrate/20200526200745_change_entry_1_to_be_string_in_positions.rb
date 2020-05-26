class ChangeEntry1ToBeStringInPositions < ActiveRecord::Migration[6.0]
  def change
    change_column :positions, :entry_1, :string
    change_column :positions, :entry_2, :string
  end
end
