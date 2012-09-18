class AppController < ApplicationController
  before_filter :authenticate_user!, :only=>[:new,:create]
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
    flash[:notice] = "App #{@app.name} created"
    render 'home/index'
  end

end
