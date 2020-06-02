class AddRemainingSizeToPosition < ActiveRecord::Migration[6.0]
  def change
    add_column :positions, :remaining_size, :integer, default: :size
  end
end
