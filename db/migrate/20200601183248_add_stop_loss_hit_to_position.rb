class AddStopLossHitToPosition < ActiveRecord::Migration[6.0]
  def change
    add_column :positions, :stop_loss_hit, :boolean, default: false
  end
end
