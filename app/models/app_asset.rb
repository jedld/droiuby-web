class AppAsset < ActiveRecord::Base

  belongs_to :app

  attr_accessible :uri, :asset_type, :version

end


