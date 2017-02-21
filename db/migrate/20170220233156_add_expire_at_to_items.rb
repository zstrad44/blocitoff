class AddExpireAtToItems < ActiveRecord::Migration
  def change
    add_column :items, :expire_at, :DateTime
    add_column :items, :do_expire, :boolean, :default => true
    add_column :items, :days_to_expire, :integer
    add_column :items, :set_priority, :boolean
  end
end
