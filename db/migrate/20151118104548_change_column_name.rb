class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :users, :link_count, :links_count
  end
end
