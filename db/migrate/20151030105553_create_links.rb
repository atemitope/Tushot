class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :long_url
      t.string :short_url
      t.integer :user_id
      t.integer :clicks,  default: 0

      t.timestamps null: false
    end
  end
end
