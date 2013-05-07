class AddActiveToPoem < ActiveRecord::Migration
  def change
    add_column :poems, :active, :boolean, :default => true
  end
end
