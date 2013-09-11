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
    today = Time.now.strftime("%Y-%m-%d")
    start_on = params["share"]["start_on"]
    end_on = params["share"]["end_on"]
    item_id = params["share"]["item_id"]

    share = Share.new
    share.item_id = item_id
    share.start_on = start_on
    share.end_on = end_on
    share.borrower_id = current_user.id

    if end_on < start_on || start_on < today
      redirect_to new_share_path(item_id: item_id)
    elsif share.save
      redirect_to shares_url
    else
      redirect_to new_share_path(item_id: item_id)
    end
  end

  def show
    @share = Share.find(params[:id])
    @review = Review.new
    @feedback = Review.where(share_id: @share.id)
  end

  def edit
    @share = Share.find(params[:id])
    unless @share.item.user == current_user || @share.borrower = current_user
      redirect_to share_path(@share.id)
    end
  end

  # called when details about the share are updated
  def details
    @share = Share.find(params[:id])
    if @share.update_attributes(params[:share])
      redirect_to share_url(@share)
    else
      render :edit
    end
  end

  # called only when new status
  def update
    new_status = params[:update_type]
    @share = Share.find(params[:share_id])
    @share.status = new_status
    if @share.save
      if new_status == "checkedout"
        @share.item.user.amt_shared += @share.item.price
        @share.item.user.points += 2
        @share.item.user.save
        @share.borrower.amt_borrowed += @share.item.price
        @share.borrower.points -= 2
        @share.borrower.save
      elsif new_status == "returned"
        @share.borrower.points +=1
        @share.borrower.save
      end
    else
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

