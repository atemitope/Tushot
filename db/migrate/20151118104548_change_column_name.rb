class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :users, :link_count, :links_count
    rename_column :details, :refferer, :referrer
  end
end
