class ReviewsController < ApplicationController
  def index

  end

  def new
    @share = Share.find(params[:share_id]) #Share.find(params[:share_id]) #CHANGE THIS
    @review = Review.new
  end

  def create
    @review = Review.new(params[:review])
    @share = Share.find(params[:review][:share_id])
    if @review.valid?
      @review.save
      params
      redirect_to share_path(@share) #id: @review.id, :share_id @review.share.id
    else 
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

