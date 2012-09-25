class ResourceController < ApplicationController

  before_filter :authenticate_user!, :except => [:show]
  before_filter :load_app, :only => [:new, :list, :show]

  def new
    @resource = @app.resources.new
  end

  def create
    app = App.find_by_id params[:resource][:app_id]
    if app && current_user.apps.include?(app)
      @resource = app.resources.create(params[:resource])
      @resource.save!
      if params[:main_layout] == '1'
        app.main_layout_id = @resource.id
        app.save!
      end
      flash[:notice] = "resource saved"
    else
      flash[:error] = "Error loading resource or app"
    end
    redirect_to show_resource_path(@resource.app)
  end

  def update
    app = App.find_by_id params[:resource][:app_id]
    if app && current_user.apps.include?(app)
      @resource = app.resources.where(id: params[:resource][:id]).first
      if @resource && @resource.update_attributes(params[:resource])
        if params[:main_layout] == '1'
          app.main_layout_id = @resource.id
          app.save!
          flash[:notice] = "resource #{@resource.name} updated and set as main layout"
        else
          flash[:notice] = "resource #{@resource.name} updated"
        end

        redirect_to edit_resource_path(@resource)
      else
        flash[:error] = "Unable to update resource"
      end
    end
  end

  def list

  end

  def show_for_update
    resource = Resource.find_by_id params[:id]
    if resource.user == current_user
      @resource = resource
      @app = resource.app
      render :new
    end
  end

  def show
    resource = @app.resources.where(name: params[:resource_name]).first
    if resource.is_template?
      render :text=>resource.body, :content_type => "application/xml"
    else
      render :text=>"unknown content", :content_type => "text/plain"
    end
  end

private
  def load_app
    a = params[:id]
    app = App.find_by_id a
    unless app.nil?
      @app = app
    else
      app = App.find_by_name a
      @app = app
    end
  end
end
