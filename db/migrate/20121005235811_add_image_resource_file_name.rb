class AddImageResourceFileName < ActiveRecord::Migration
  def change
    add_column :resources, :image_resource_file_name, :string
  end
end
