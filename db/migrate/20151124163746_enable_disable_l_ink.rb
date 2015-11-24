class EnableDisableLInk < ActiveRecord::Migration
  def change

    add_column :links, :deleted, :boolean, default: false
    add_column :links, :disabled, :boolean, default: false
  end
end
