class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def profile_picture_path(user)
    graph = Koala::Facebook::API.new(user.oauth_token)
    graph.get_picture(user.facebook_id)
  end

  def is_friend?(friend)
    Friend.get_friends(current_user).include?(friend)
  end

  def friend_request_pending?(friend)
  end

  def redirect_to_root_if_logged_out
    redirect_to :root if !current_user
  end

  def user_image_link(user)
    link_to image_tag(profile_picture_path(user)), user_path(user)
  end

  helper_method :profile_picture_path
  helper_method :current_user
  helper_method :is_friend?
  helper_method :friend_request_pending?
  helper_method :redirect_to_root_if_logged_out
  helper_method :user_image_link
end

