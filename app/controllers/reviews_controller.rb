class ReviewsController < ApplicationController
  def index

  end

  def new
    # new_share_review GET    /shares/:share_id/reviews/new(.:format)      reviews#new
    @share = Share.find(params[:share_id]) #Share.find(params[:share_id]) #CHANGE THIS
    @review = Review.new
    # @item = Item.find(params[:item_id])
  end

  def create
    @review = Review.new(params[:review])
    if @review.valid?
      @review.save
      puts " saved the review ............" * 50
      redirect_to review_path(@review) #id: @review.id, :share_id @review.share.id
    else 
      @share = Share.find(params[:review][:share_id])
      render :new
    end 
  end

  def show
    @review = Review.find(params[:id])
    @share = Share.find(@review.share.id)
  end

  def edit
    @share = Share.find(params[:id])
    unless @share.item.user == current_user || @share.borrower = current_user
      redirect_to share_path(@share.id)
    end
  end
end

