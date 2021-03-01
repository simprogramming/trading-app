class AddDirectionToEma < ActiveRecord::Migration[6.0]
  def change
    add_column :emas, :direction, :string
  end
end
