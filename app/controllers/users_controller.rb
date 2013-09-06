class UsersController < ApplicationController
  include UsersHelper
  def friends
    @graph = Koala::Facebook::API.new(current_user.oauth_token)
    @friends = @graph.get_connections("me", "friends")
    @matches = parse_facebook
  end

  def show
    @user = current_user
    @items = @user.items
  end
end
