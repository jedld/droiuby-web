# Load the rails application
require File.expand_path('../application', __FILE__)


Haml::Template.options[:format] = :xhtml

# Initialize the rails application
DroiubyWeb::Application.initialize!
