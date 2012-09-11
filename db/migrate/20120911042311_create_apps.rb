class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name
      t.string :description
      t.string :launcher_icon
      t.string :base_url
      t.string :main_layout
      t.integer :user_id
      t.timestamps
    end
  end
end
