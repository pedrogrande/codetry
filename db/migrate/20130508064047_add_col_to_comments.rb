class AddColToComments < ActiveRecord::Migration
  def change
    add_column :comments, :poem_id, :integer
    add_index :comments, :poem_id
  end
end
