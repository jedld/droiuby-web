class AddVersionAppAsset < ActiveRecord::Migration
  def change
    add_column :app_assets, :version, :string
  end

end
