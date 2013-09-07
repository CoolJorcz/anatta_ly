class SharesController < ApplicationController
  def index
    # @friends = Friend.get_friends(current_user)
  end

  def new
    # @matches = facebook_friends_to_add
    @share = Share.new
    @item = Item.find(params[:item_id])
  end

  def create
    # friend = Friend.create(requester_id: current_user.id, receiver_id: params[:receiver_id])
    # redirect_to friend_url(friend)
  end

  def show
  end

  def accept
    # @friend = Friend.find_by_id(params[:friend_id])
    # @friend.approved = true
    # if !@friend.save
    #   flash[:notice] = "Failed friend approval"
    # end

    # redirect_to requests_url
  end

  # Friend denial or removal
  def destroy
    # @friend = Friend.find_by_id(params[:id])
    # @friend.destroy
    # redirect_to requests_url
  end
end
