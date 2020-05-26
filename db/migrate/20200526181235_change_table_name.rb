class ChangeTableName < ActiveRecord::Migration[6.0]
  def change
    rename_table :watchlists, :hot_stocks
  end
end
