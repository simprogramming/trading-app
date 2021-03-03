class CreateMyPositions < ActiveRecord::Migration[6.0]
  def change
    create_table :my_positions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :stock, null: false, foreign_key: true
      t.integer :size
      t.float :target
      t.float :stop_loss
      t.float :iceline
      t.float :current_price
      t.string :buy_sell
      t.float :entry
      t.float :r1
      t.integer :remaining_size
      t.boolean :r1_hit, default: false
      t.boolean :stop_loss_hit, default: false
      t.boolean :target_hit, default: false

      t.timestamps
    end
  end
end
