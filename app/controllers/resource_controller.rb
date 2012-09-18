class ResourceController < ApplicationController

  before_filter :authenticate_user!
  before_filter :load_app, :only => [:new, :list]

  def new
    @resource = @app.resources.new
  end

  def create
    @resource = Resource.new(params[:resource])
    @resource.save!
    flash[:notice] = "resource saved"
    redirect_to show_resource_path(@resource.app)
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
