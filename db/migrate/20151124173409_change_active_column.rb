class ChangeActiveColumn < ActiveRecord::Migration
  def change
    change_column :links, :active, :boolean, default: true
  end
end
