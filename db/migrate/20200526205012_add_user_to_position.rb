class AddUserToPosition < ActiveRecord::Migration[6.0]
  def change
    add_reference :positions, :user, foreign_key: true
  end
end
