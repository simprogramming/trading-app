class AddSubcategoryToDocuments < ActiveRecord::Migration[6.0]
  def change
    add_column :documents, :subcategory, :string
  end
end
