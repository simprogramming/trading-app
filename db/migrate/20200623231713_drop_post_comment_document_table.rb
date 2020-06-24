class DropPostCommentDocumentTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :comments
    drop_table :posts
    drop_table :documents
  end
end
