class AddLauncherIconFilename < ActiveRecord::Migration
  def change
    add_column :apps, :launcher_icon_file_name, :string
  end
end
