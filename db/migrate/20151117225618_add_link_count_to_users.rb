class AddLinkCountToUsers < ActiveRecord::Migration

  def self.up

    add_column :users, :link_count, :integer, :null => false, :default => 0

  end

  def self.down

    remove_column :users, :link_count

  end

end
