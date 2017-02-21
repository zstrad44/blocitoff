class AddResetToItems < ActiveRecord::Migration
  def change
    add_column :items, :reset_item, :boolean, :default => false
  end
end
