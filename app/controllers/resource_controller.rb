class ResourceController < ApplicationController

  before_filter :authenticate_user!, :except => [:show]
  before_filter :load_app, :only => [:new, :list, :show]
  before_filter :load_resource, :only => [:show]

  def new
    @resource = @app.resources.new
    @resource.resource_type = Resource::TYPE[:template]
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
    redirect_to edit_resource_path(@resource)
  end

  def destroy
    @resource = Resource.find params[:id]
    @resource.destroy
    render :json=>{status: 'ok'}
  end

  def update
    app = App.find_by_id params[:resource][:app_id]
    if app && current_user.apps.include?(app)
      if (params[:resource][:id].blank?)
        Resource.transaction do
          @resource = app.resources.create(params[:resource])
          @resource.save!
          if params[:main_layout] == '1'
            app.main_layout_id = @resource.id
            app.save!
          end
        end
      else
        @resource = app.resources.where(id: params[:resource][:id]).first
        if @resource && @resource.update_attributes(params[:resource])
          if params[:main_layout] == '1'
            app.main_layout_id = @resource.id
            app.save!
            flash[:notice] = "resource #{@resource.name} updated and set as main layout"
          else
            flash[:notice] = "resource #{@resource.name} updated"
          end
        end
      end

      respond_to do |format|
        format.json { render :json => {status: 'success', id: @resource.id, body: @resource.body} }
        format.html { redirect_to edit_resource_path(@resource) }
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
    if @resource.is_script?
      render :text => @resource.body, :content_type => "application/x-ruby"
    elsif @resource.is_template?
      render :text => @resource.body, :content_type => "application/xml"
    elsif @resource.is_image?
      redirect_to @resource.image_resource.url, :type=>"image/png"
    else
      render :text => @resource.body, :content_type => "text/plain"
    end
  end

  private

  def load_resource
    @resource = @app.resources.where(name: params[:resource_name]).first

    Rails.logger.error @app.resources.inspect
    @resource
  end

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
