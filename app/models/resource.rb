class Resource < ActiveRecord::Base

  TYPE = {template: 0, image: 1, script: 2}

  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :app_id
  validates_presence_of :resource_type

  belongs_to :app

end
