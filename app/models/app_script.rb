class AppScript < ActiveRecord::Base

  validates_presence_of :name
  validates_uniqueness_of :name, :scope=>:app_id

  belongs_to :app
end
