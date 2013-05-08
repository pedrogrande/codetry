class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :about, :text
    add_column :users, :picture_url, :string
    add_column :users, :location_url, :string
    add_column :users, :facebook_url, :string
    add_column :users, :twitter_url, :string
    add_column :users, :website_url, :string
    add_column :users, :followers, :string
    add_column :users, :following, :string
    add_column :users, :total_upvotes, :integer
    add_column :users, :number_of_poems, :integer
  end
end
