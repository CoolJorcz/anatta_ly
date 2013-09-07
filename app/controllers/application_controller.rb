class ApplicationController < ActionController::Base
  protect_from_forgery

  private
    # why is this a private method?
    def current_user
    	@current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user
end
