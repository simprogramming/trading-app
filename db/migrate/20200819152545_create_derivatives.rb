class CreateDerivatives < ActiveRecord::Migration[6.0]
  def change
    create_table :derivatives do |t|
      t.text :content
      t.string :day

      t.timestamps
    end
  end
end
