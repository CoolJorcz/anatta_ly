class SharesController < ApplicationController
  def index
    @share_requests = Share.shares(current_user, "pending")
    @share_approvals = Share.shares(current_user, "approved")
    @share_checkouts = Share.shares(current_user, "checkedout")
    @borrow_requests = Share.borrows(current_user, "pending")
    @borrow_approvals = Share.borrows(current_user, "approved")
    @borrow_checkouts = Share.borrows(current_user, "checkedout")
  end

  def new
    @share = Share.new
    @item = Item.find(params[:item_id])
  end

  def create
    share = Share.new
    share.item_id = params["share"]["item_id"]
    share.start_on = params["share"]["start_on"]
    share.end_on = params["share"]["end_on"]
    share.borrower_id = current_user.id

    if share.save
      redirect_to shares_url
    else
      redirect_to new_share_path(item_id: params["share"]["item_id"])
    end
  end

  def show
  end

  def update
    @share = Share.find(params[:share_id])
    @share.status = params[:update_type]
    if !@share.save
      flash[:notice] = "Failed share approval"
    end
    redirect_to shares_url
  end

  def destroy
    @share = Share.find(params[:id])
    @share.destroy
    redirect_to shares_url
  end
end

