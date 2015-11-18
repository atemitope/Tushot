class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.string :browser
      t.string :string
      t.string :refferer
      t.string :string
      t.string :location
      t.string :string

      t.timestamps null: false
    end
  end
end
