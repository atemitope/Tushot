class AddLinkIdToDetails < ActiveRecord::Migration
  def change
    add_column :details, :link_id, :integer
  end
end
