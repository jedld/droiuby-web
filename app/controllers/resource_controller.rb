class ResourceController < ApplicationController

  before_filter :authenticate_user!
  before_filter :load_app

  def new
    @resource = Resource.new

  end
  def list

  end


private
  def load_app
    a = params[:id]
    app = App.find_by_id a
    unless app.nil?
      @app = app
    end
  end
end
