class ReviewsController < ApplicationController
  def index

  end

  def new
    # new_share_review GET    /shares/:share_id/reviews/new(.:format)      reviews#new
    @share = Share.find(params[:share_id])
    @review = Review.new
    # @item = Item.find(params[:item_id])
  end

  def create
    # Review.new(share_id:)
    # @user = current_user
    # @item = Item.new(params[:item])
    # @item.user_id = @user.id
    # puts @item

    # if @item.valid?
    #   @item.save
    #   redirect_to item_url(@item)
    # else
    #   render :new
    # end
  end

  def show
    @share = Share.find(params[:id])
  end

  def edit
    @share = Share.find(params[:id])
    unless @share.item.user == current_user || @share.borrower = current_user
      redirect_to share_path(@share.id)
    end
  end
end

