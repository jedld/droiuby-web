class AppAsset < ActiveRecord::Base

  belongs_to :app

  TYPE = {script: 0, image: 1, css: 2}
  attr_accessible :uri, :asset_type, :version

  def asset_type_name
    case asset_type
      when TYPE[:script]
        return "script"
      when TYPE[:image]
        return "image"
      when TYPE[:css]
        return "css"
      end
  end
end


