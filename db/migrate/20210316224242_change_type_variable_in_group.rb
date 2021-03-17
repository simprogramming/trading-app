class ChangeTypeVariableInGroup < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :tow_titre,:string,  array: true
    remove_column :groups, :tow_symbol
  end
end
