class CreateWatchedStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :watched_stocks do |t|
      t.references :stock, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
