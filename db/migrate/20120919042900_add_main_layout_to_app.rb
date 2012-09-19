class AddMainLayoutToApp < ActiveRecord::Migration
  def change
    add_column :apps, :main_layout_id, :integer
    add_column :apps, :short_name, :string
  end
end
