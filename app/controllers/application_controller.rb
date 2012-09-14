class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :check_user_agent


  def is_droiuby_agent?
    @droiuby_agent
  end

  protected



  def check_user_agent
    @droiuby_agent = false
    if request.env['HTTP_USER_AGENT'].match /^Droiuby/
      @droiuby_detected = true
      request.format = 'xml'
    end
  end

end
