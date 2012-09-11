class AppController < ApplicationController

  layout :false

  def show
    name = params[:name]
    @app = App.find_by_name name
  end
end
