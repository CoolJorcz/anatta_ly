class UsersController < ApplicationController
  include UsersHelper
  def friends
    @graph = Koala::Facebook::API.new(current_user.oauth_token)
    @friends = @graph.get_connections("me", "friends")
    @matches = parse_facebook
  end

  def show
    @user = User.find_by_id(params[:id])
    if (current_user == @user) || is_friend?(@user)
      @items = @user.items
    else
      redirect_to user_path(current_user)
    end
  end
end
