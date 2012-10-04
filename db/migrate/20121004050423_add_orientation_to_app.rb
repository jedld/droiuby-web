class AddOrientationToApp < ActiveRecord::Migration
  def change
    add_column :apps, :orientation, :string, :default => 'none'
  end
end
