class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def profile_picture_path(user)
    graph = Koala::Facebook::API.new(user.oauth_token)
    graph.get_picture(user.facebook_id)
  end

  def is_friend?(friend_object)
    Friend.get_friends(current_user).include?(friend_object)
  end

  helper_method :current_user
  helper_method :is_friend?
end
