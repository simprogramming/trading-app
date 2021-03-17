class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :tow_symbol

      t.timestamps
    end
  end
end
