class CreatePoems < ActiveRecord::Migration
  def change
    create_table :poems do |t|
      t.string :title
      t.text :content
      t.text :slug
      t.string :language
      t.references :user

      t.timestamps
    end
    add_index :poems, :user_id
    add_index :poems, :slug, :unique => true
  end
end
