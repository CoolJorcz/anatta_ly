class FriendsController < ApplicationController
  def index
    # Current Friends
    @friends = Friend.get_friends(current_user)
  end

  def new
    # All possible friends and request linkes
    @possible_friends = Friend.facebook_friends_to_add(current_user)

    #Pending requests
    @user = current_user
    @friend_requests = Friend.where(receiver_id: @user.id, approved: false)
  end

  def create
    friend = Friend.create(requester_id: current_user.id, receiver_id: params[:receiver_id])
    redirect_to friend_url(friend)
  end

  def show
  end

  def accept
    @friend = Friend.find_by_id(params[:friend_id])
    @friend.approved = true
    if !@friend.save
      flash[:notice] = "Failed friend approval"
    end

    redirect_to friends_url
  end

  def destroy
    @friend = Friend.find_by_id(params[:id])
    @friend.destroy
    redirect_to friends_url
  end
end

