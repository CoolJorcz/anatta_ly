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
    share = Share.new
    share.item_id = params["share"]["item_id"]
    share.borrower_id = current_user.id
    share.start_on = params["share"]["start_on"]
    share.end_on = params["share"]["end_on"]
    if share.save
      redirect_to shares_url
    else
      redirect_to new_share(params["share"]["item_id"])
    end
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
