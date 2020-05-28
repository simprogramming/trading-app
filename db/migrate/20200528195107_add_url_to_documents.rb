class AddUrlToDocuments < ActiveRecord::Migration[6.0]
  def change
    add_column :documents, :url, :string
  end
end
