class AddMakeAppPublic < ActiveRecord::Migration
  def change
    add_column :apps, :is_public, :boolean
  end
end
