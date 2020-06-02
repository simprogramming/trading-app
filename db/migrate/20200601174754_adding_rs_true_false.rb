class AddingRsTrueFalse < ActiveRecord::Migration[6.0]
  def change
    add_column :positions, :r1_hit, :boolean, default: false
    add_column :positions, :r2_hit, :boolean, default: false
    add_column :positions, :r3_hit, :boolean, default: false
  end
end
