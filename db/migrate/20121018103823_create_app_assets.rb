class CreateAppAssets < ActiveRecord::Migration
  def change
    create_table :app_assets do |t|
      t.references :app
      t.string :uri
      t.integer :asset_type
      t.timestamps
    end
  end
end
