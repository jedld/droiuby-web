class Resource < ActiveRecord::Base

  TYPE = {template: 0, image: 1, script: 2}

  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :app_id
  validates_presence_of :resource_type

  before_validation :transform_name

  attr_accessible :app_id, :name, :resource_type, :body

  belongs_to :app

  delegate :user, :to=>:app

  def resource_type_name
    case resource_type
      when TYPE[:template]
        "template"
      when TYPE[:image]
        "image"
      when TYPE[:script]
        "script"
    end
  end

  def main_layout?
    app.main_layout_id == self.id
  end

  def is_template?
    resource_type == TYPE[:template]
  end

  protected

  def transform_name
    self.name = self.name.underscore
  end

end
