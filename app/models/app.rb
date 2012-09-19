class App < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_uniqueness_of :short_name


  belongs_to :user
  has_many :resources


  attr_accessible :name, :description, :base_url, :main_layout

  before_validation :convert_short_name

  def main_layout
    resource = self.resources.where(id: main_layout_id).first
    unless resource.nil?
      resource.name
    else
      "main.xml"
    end
  end

  protected

  def convert_short_name
    if short_name
      self.short_name= self.short_name.underscore
    else
      self.short_name = self.name.underscore
    end
  end

end
