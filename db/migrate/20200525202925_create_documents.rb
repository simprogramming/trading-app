class CreateDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :documents do |t|
      t.string :category
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
