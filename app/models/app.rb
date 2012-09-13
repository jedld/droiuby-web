class App < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name

  belongs_to :user
  has_many :resources


  attr_accessible :name, :description, :base_url, :main_layout

end
