class AddCategoryToSymbol < ActiveRecord::Migration[6.0]
  def change
    add_column :stocks, :name, :string
    add_column :stocks, :category, :string
    add_column :stocks, :grade, :string
  end
end
