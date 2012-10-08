class AppController < ApplicationController
  before_filter :authenticate_user!, :only=>[:new, :create, :update]
  before_filter :load_app, :only=>[:update, :edit_show, :info]
  skip_before_filter :check_user_agent, :only => [:show]
  layout :false, :only => :show

  def show
    name = params[:name]
    @app = App.find_by_name name
    respond_to do |format|
      format.xml # index.xml.builder
    end
  end

  def update
    if @app.update_attributes(params[:app])
      flash[:notice] = "App #{@app.name} updated."
    else
      flash[:error] = @app.errors
    end
    render "app/new"
  end

  def edit_show
    render :new
  end

  def new
    @app = App.new
  end

  def info

  end

  def index
    page = params[:page] || 1
    @apps = App.public.paginate(:page => page).order('id DESC')
  end

  def create
    @app = App.new(params[:app])
    @app.user = current_user
    @app.save!
    flash[:notice] = "App #{@app.name} created"
    render 'home/index'
  end

protected

    def load_app
      @app = App.find_by_id params[:id]
    end

end
