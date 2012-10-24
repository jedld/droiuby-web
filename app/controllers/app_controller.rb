class AppController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create, :update, :update_asset]
  before_filter :load_app, :only => [:update, :edit_show, :info, :update_asset]
  skip_before_filter :check_user_agent, :only => [:show]
  layout :false, :only => :show

  def show
    name = params[:name]
    @app = App.find_by_short_name name
    @app_asset = @app.app_assets.new
    respond_to do |format|
      format.xml # index.xml.builder
    end
  end

  def update
    @app_asset = @app.app_assets.new
    if @app.update_attributes(params[:app])
      flash[:notice] = "App #{@app.name} updated."
    else
      flash[:error] = @app.errors
    end
    render "app/new"
  end

  def edit_show
    @app_asset = @app.app_assets.new
    render :new
  end

  def new
    @app = App.new
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

  def update_asset
    asset_id = params[:app_asset][:id]
    @app = current_user.apps.where(id: params[:app_id]).first
    unless asset_id.blank?
      app_asset = @app.app_assets.where(id: asset_id).first
      app_asset.update_attributes!(params[:app_asset])
      result = {status: 'success', id: app_asset.id, uri: app_asset.uri}
    else
      app_asset = @app.app_assets.create!(params[:app_asset])
      result = {status: 'success', id: app_asset.id, uri: app_asset.uri, is_new: 'true'}
    end
    @app_asset = @app.app_assets.new
    result.merge!(partial: render_to_string(partial: 'app_assets/asset_list'))
    respond_to do |format|
      format.json { render :json => result }
      format.html { redirect_to edit_resource_path(@resource) }
    end
  end

  protected

  def load_app
    @app = App.find_by_id params[:id]
  end

end

