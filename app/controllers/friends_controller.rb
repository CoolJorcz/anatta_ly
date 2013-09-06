class FriendsController < ApplicationController
  include UsersHelper

  def index
    @friends = get_friends
  end

  def new
    ## only friends I have not requested and aren't friends with
    @matches = parse_facebook
  end

  def create
    @friend = Friend.new
    @friend.requester_id = current_user.id
    @friend.receiver_id = params[:receiver_id]
    @friend.save
    redirect_to friend_url(@friend)
  end

  def show

  end

  def accept
    debugger
    @friend = Friend.find_by_id(params[:friend_id])
    @friend.approved = true
    @friend.save!
    redirect_to requests_url
  end

  def destroy
    # Friend denial or removal
    @friend = Friend.find_by_id(params[:id])
    @friend.destroy
    redirect_to requests_url
  end
end

