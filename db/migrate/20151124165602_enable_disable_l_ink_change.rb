class EnableDisableLInkChange < ActiveRecord::Migration
  def change
    rename_column :links, :disabled, :active
    change_column :links, :active, :boolean, default: true
  end
end
