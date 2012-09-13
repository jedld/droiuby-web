class AppController < ApplicationController

  layout :false, :only => :show

  def show
    name = params[:name]
    @app = App.find_by_name name
    respond_to do |format|
      format.html # index.html.erb
      format.xml # index.xml.builder
    end
  end

  def new
    @app = App.new
  end

  def create
    @app = App.new(params[:app])
    @app.user = current_user
    @app.save!
    render 'home/index'
  end

end
