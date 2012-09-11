class CreateAppScripts < ActiveRecord::Migration
  def change
    create_table :app_scripts do |t|
      t.integer :app_id
      t.string :name
      t.string :content
      t.timestamps
    end
  end
end
