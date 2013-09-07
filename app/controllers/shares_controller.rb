class SharesController < ApplicationController
  def index
    # @friends = Friend.get_friends(current_user)
    @share_requests = Share.share_requests(current_user)
    # @share_approvals =
    # @share_checkouts =
    @borrow_requests = Share.borrow_requests(current_user)
    # @borrow_approvals =
    # @borrow_checkouts =
  end

  def new
    @share = Share.new
    @item = Item.find(params[:item_id])
  end

  def create
    share = Share.new
    # share = Share.new(params["share"])
    share.item_id = params["share"]["item_id"]
    share.start_on = params["share"]["start_on"] # Make sure these transform to datetimes!!!!
    share.end_on = params["share"]["end_on"] # Make sure these transform to datetimes!!!!
    share.borrower_id = current_user.id

    if share.save
      redirect_to shares_url
    else
      redirect_to new_share_path(item_id: params["share"]["item_id"])
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
