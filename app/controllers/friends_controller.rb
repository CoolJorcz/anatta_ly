class FriendsController < ApplicationController
  include UsersHelper
  def index
    # Should only be user's possible friends
    @users = User.all
  end

  def new
    @graph = Koala::Facebook::API.new(current_user.oauth_token)
    @friends = @graph.get_connections("me", "friends")
    @matches = parse_facebook
  end

  def create
    @friend = Friend.new
    @friend.requester_id = 1 # should be current_user
    @friend.receiver_id = params[:receiver_id]
    @friend.save
    redirect_to friend_url(@friend)
  end

  def show

  end

  def accept
    puts '-' * 100
    puts params
    @friend = Friend.find_by_id(params[:friend_id])
    @friend.approved = true
    @friend.save
    redirect_to requests_url

  end

  def destroy
    # Make sure redirects to correct user
    @friend = Friend.find_by_id(params[:id])
    @friend.destroy
    redirect_to requests_url
  end
end
