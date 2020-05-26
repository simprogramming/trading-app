class CreatePositions < ActiveRecord::Migration[6.0]
  def change
    create_table :positions do |t|
      t.integer :entry_1
      t.integer :quantity_1
      t.integer :entry_2
      t.integer :quantity_2
      t.integer :target
      t.integer :stop_loss
      t.integer :close_1
      t.integer :c_quantity_1
      t.integer :c_quantity_2
      t.integer :close_3
      t.integer :c_quantity_3
      t.references :stock, null: false, foreign_key: true

      t.timestamps
    end
  end
end
