class FriendsController < ApplicationController
  def index
    # Should only be user's possible friends
    @users = User.all
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
end
