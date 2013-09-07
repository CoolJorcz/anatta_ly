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

  def accept
    puts '-' * 100 # NEVER MERGE IN DEBUGGING CODE LIKE THIS INTO MASTER!!!!!!!!!!!!!!!!!!!!
    puts params
    @friend = Friend.find_by_id(params[:friend_id])
    @friend.approved = true
    @friend.save
    redirect_to requests_url
    # why is there a newline here?
  end

  def destroy
    # Make sure redirects to correct user
    @friend = Friend.find_by_id(params[:id])
    @friend.destroy
    redirect_to requests_url
  end
end
