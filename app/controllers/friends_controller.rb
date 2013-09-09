class FriendsController < ApplicationController
  def index
    @friends = Friend.get_friends(current_user)
  end

  def new
    @possible_friends = Friend.facebook_friends_to_add(current_user)

    @user = current_user
    @friend_requests = Friend.where(receiver_id: @user.id, approved: false)
  end

  def create
    receiver = User.find(params[:receiver_id])
    unless Friend.already_friends_or_requested?(current_user, receiver)
      friend = Friend.create(requester_id: current_user.id, receiver_id: receiver.id)
    end
    redirect_to new_friend_url #(friend)
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

