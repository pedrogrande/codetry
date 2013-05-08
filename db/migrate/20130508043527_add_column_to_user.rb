class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :about, :text
    add_column :users, :picture, :string
    add_column :users, :location, :string
    add_column :users, :facebook, :string
    add_column :users, :twitter, :string
    add_column :users, :website, :string
    add_column :users, :followers, :string
    add_column :users, :following, :string
    add_column :users, :total_upvotes, :integer
    add_column :users, :number_of_poems, :integer
  end
end
