class UsersController < ApplicationController
  include UsersHelper

  def friends
    @graph = Koala::Facebook::API.new(current_user.oauth_token)
    @friends = @graph.get_connections("me", "friends")
    @matches = parse_facebook
  end

  def show
    # User's prof page. Should be the current_user
    @user = current_user.find_by_id(1)
    @item = Item.first
    @items = @user.items
  end
end
