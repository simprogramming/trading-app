class CreateEmas < ActiveRecord::Migration[6.0]
  def change
    create_table :emas do |t|
      t.references :user, null: false, foreign_key: true
      t.references :stock, null: false, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
