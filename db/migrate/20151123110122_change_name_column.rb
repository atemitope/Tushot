class ChangeNameColumn < ActiveRecord::Migration
  def change
    rename_column :details, :refferer, :referrer
  end
end
