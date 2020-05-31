class AddDefaultToCash < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :cash, :float, default: 100000
  end
end
