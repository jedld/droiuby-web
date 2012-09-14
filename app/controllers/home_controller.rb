class HomeController < ApplicationController

  before_filter :authenticate_user!, :except=>[:droiuby]
  layout :false, :only =>[:droiuby]

  def index
  end

  def droiuby
  end

end
