class AppController < ApplicationController

  layout :false

  def show
    name = params[:name]
    @app = App.find_by_name name
  end

  def new
    @app = App.new
  end

  def create
    @app = App.new(params[:app])
    @app.user = current_user
    @app.save!
  end

end
