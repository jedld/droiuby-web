class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :name
      t.integer :app_id
      t.integer :resource_type
      t.string :resource_url
      t.timestamps
    end
  end
end
