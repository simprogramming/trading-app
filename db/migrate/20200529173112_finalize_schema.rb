class FinalizeSchema < ActiveRecord::Migration[6.0]
  def change
    remove_column :positions, :entry_2
    remove_column :positions, :quantity_2

    remove_column :positions, :c_quantity_3
    remove_column :positions, :c_quantity_2
    remove_column :positions, :c_quantity_1
  end
end
